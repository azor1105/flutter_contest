import 'package:flutter_contest/data/models/file_info/file_info.dart';
import 'package:flutter_contest/data/services/hive/file_hive/models/file_hive_model.dart';
import 'package:flutter_contest/presentation/utils/constants/hive_keys.dart';
import 'package:hive/hive.dart';

class FileHiveService {
  static Box<FileHiveModel> getDownloadedFiles() => Hive.box<FileHiveModel>(HiveKeys.downloadedFilesBox);

  static void addFile({required String fileName, required String filePath}) {
    final files = getDownloadedFiles();
    files.add(FileHiveModel(name: fileName, filePath: filePath));
  }
}
