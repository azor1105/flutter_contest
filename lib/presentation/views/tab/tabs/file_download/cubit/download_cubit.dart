import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flowder/flowder.dart';
import 'package:flutter_contest/data/models/file_info/file_info.dart';
import 'package:flutter_contest/data/services/hive/file_hive/file_hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

part 'download_state.dart';

class DownloadCubit extends Cubit<DonwloadState> {
  DownloadCubit() : super(const DonwloadState());
  DownloaderCore? _core;
  Future<void> download({required FileInfo fileInfo}) async {
    bool isGranted = await requestStorage();
    if (!isGranted) return;
    var docDir = await getApplicationDocumentsDirectory();
    String path =
        "${docDir.path}/${fileInfo.fileName}.${fileInfo.fileUrl.substring(
      fileInfo.fileUrl.length - 5,
      fileInfo.fileUrl.length,
    )}";

    final downloaderUtils = DownloaderUtils(
      progressCallback: (current, total) {
        emit(
          state.copyWith(progress: (current / total) * 100),
        );
      },
      file: File(path),
      progress: ProgressImplementation(),
      onDone: () => FileHiveService.addFile(
        fileName: fileInfo.fileName,
        filePath: path,
      ),
      deleteOnCancel: true,
    );
    _core = await Flowder.download(fileInfo.fileUrl, downloaderUtils);
  }

  Future<bool> requestStorage() async {
    await Permission.storage.request();
    return await Permission.storage.isGranted;
  }

  Future<void> pause() async {
    await _core!.pause();
    emit(
      state.copyWith(isPaused: true),
    );
  }

  Future<void> resume() async {
    await _core!.resume();
    emit(
      state.copyWith(
        isPaused: false,
      ),
    );
  }
}
