import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_contest/data/models/file_info/file_info.dart';
import 'package:flutter_contest/data/services/hive/file_hive/file_hive.dart';
import 'package:flutter_contest/presentation/utils/utils.dart';
import 'package:flutter_contest/presentation/views/tab/tabs/file_download/cubit/file_manager_cubit.dart';
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
      create: (context) => FileManagerCubit(),
      child: BlocBuilder<FileManagerCubit, FileManagerState>(
        builder: (context, state) {
          return ListTile(
            leading:
                FileHiveService.getFileByName(name: fileInfo.fileName) == null
                    ? const Icon(Icons.download)
                    : const Icon(Icons.download_done),
            title: Text(fileInfo.fileName),
            subtitle: LinearProgressIndicator(
              value: state.progress,
              backgroundColor: Colors.black,
            ),
            onTap: () {
              context.read<FileManagerCubit>().download(fileInfo: fileInfo);
            },
            trailing: IconButton(
              onPressed: () {
                var downloadedFile = FileHiveService.getFileByName(
                  name: fileInfo.fileName,
                );
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
