import 'package:flutter/material.dart';
import 'package:flutter_contest/data/models/file_info/file_info.dart';
import 'package:flutter_contest/presentation/utils/constants/color_const.dart';
import 'package:flutter_contest/presentation/views/widgets/single_file_download.dart';

class FileDownloadScreen extends StatelessWidget {
  const FileDownloadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.white,
      appBar: AppBar(
        title: const Text("File download example one"),
      ),
      body: ListView.builder(
        itemCount: filesData.length,
        itemBuilder: (context, index) {
          return SingleFileDownload(
            fileInfo: filesData[index],
          );
        },
      ),
    );
  }
}
