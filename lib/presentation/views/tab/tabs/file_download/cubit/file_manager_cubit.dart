import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flowder/flowder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contest/data/models/file_info/file_info.dart';
import 'package:flutter_contest/data/services/hive/file_hive/file_hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
part 'file_manager_state.dart';

class FileManagerCubit extends Cubit<FileManagerState> {
  FileManagerCubit() : super(const FileManagerState(progress: 0.0));
  DownloaderCore? _core;

  void download({
    required FileInfo fileInfo,
  }) async {
    bool hasPermission = await _requestWritePermission();
    if (!hasPermission) return;
    var directory = await getDownloadPath();
    String url = fileInfo.fileUrl;
    String newFileLocation =
        "${directory?.path}/${fileInfo.fileName}${url.substring(url.length - 5, url.length)}";
    try {
      final downloaderUtils = DownloaderUtils(
        progressCallback: (current, total) {
          emit(
            FileManagerState(progress: (current / total) * 100),
          );
        },
        file: File(newFileLocation),
        progress: ProgressImplementation(),
        onDone: () {
          FileHiveService.addFile(
            fileName: fileInfo.fileName,
            filePath: newFileLocation,
          );
        },
        deleteOnCancel: true,
      );
      _core = await Flowder.download(
        fileInfo.fileUrl,
        downloaderUtils,
      );
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<bool> _requestWritePermission() async {
    await Permission.storage.request();
    return await Permission.storage.request().isGranted;
  }

  Future<Directory?> getDownloadPath() async {
    Directory? directory;
    try {
      if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      } else {
        directory = Directory('/storage/emulated/0/Download');
        if (!await directory.exists()) {
          directory = await getExternalStorageDirectory();
        }
      }
    } catch (err) {
      debugPrint("Cannot get download folder path");
    }
    return directory;
  }

  void onDone(FileInfo fileInfo, String fileLocation) {
    FileHiveService.addFile(
      fileName: fileInfo.fileName,
      filePath: fileLocation,
    );
  }
}
