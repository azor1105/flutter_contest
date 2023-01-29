import 'package:hive/hive.dart';

part 'file_hive_model.g.dart';

@HiveType(typeId: 1)
class FileHiveModel extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String filePath;

  FileHiveModel({
    required this.name,
    required this.filePath,
  });
}
