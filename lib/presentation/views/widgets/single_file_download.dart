import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_contest/data/models/file_info/file_info.dart';
import 'package:flutter_contest/data/services/hive/file_hive/file_hive.dart';
import 'package:flutter_contest/presentation/utils/utils.dart';
import 'package:flutter_contest/presentation/views/tab/tabs/file_download/cubit/download_cubit.dart';
import 'package:open_file_safe/open_file_safe.dart';

class SingleFileDownload extends StatelessWidget {
  const SingleFileDownload({
    Key? key,
    required this.fileInfo,
  }) : super(key: key);

  final FileInfo fileInfo;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DownloadCubit(),
      child: BlocBuilder<DownloadCubit, DonwloadState>(
        builder: (context, state) {
          var downloadedFile = FileHiveService.getFileByName(
            name: fileInfo.fileName,
          );
          return ListTile(
            leading: IconButton(
              onPressed: () {
                if (state.progress != 0.0 && downloadedFile == null) {
                  if (state.isPaused != null && state.isPaused!) {
                    context.read<DownloadCubit>().resume();
                  } else {
                    context.read<DownloadCubit>().pause();
                  }
                }
              },
              icon:
                  FileHiveService.getFileByName(name: fileInfo.fileName) != null
                      ? const Icon(Icons.download_done)
                      : state.isPaused != null && state.isPaused == true
                          ? const Icon(
                              Icons.pause,
                            )
                          : const Icon(Icons.download),
            ),
            title: Text(fileInfo.fileName),
            subtitle: downloadedFile != null
                ? const Text("Saved")
                : LinearProgressIndicator(
                    value: state.progress,
                    backgroundColor: Colors.black,
                  ),
            onTap: () {
              if (downloadedFile == null && state.progress == 0.0) {
                context.read<DownloadCubit>().download(fileInfo: fileInfo);
              }
            },
            trailing: IconButton(
              onPressed: () {
                if (downloadedFile == null) {
                  Utils.getMyToast(
                    message: "Hali yuklamagan yoki jarayonda",
                  );
                } else {
                  OpenFile.open(downloadedFile.filePath);
                }
              },
              icon: const Icon(Icons.file_open),
            ),
          );
        },
      ),
    );
  }
}
