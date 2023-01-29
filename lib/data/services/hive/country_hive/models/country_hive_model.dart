import 'package:hive/hive.dart';

part 'country_hive_model.g.dart';

@HiveType(typeId: 0)
class CountryHiveModel extends HiveObject {
  @HiveField(0)
  String code;

  @HiveField(1)
  String name;

  @HiveField(2)
  String phone;

  @HiveField(3)
  String continentCode;

  @HiveField(4)
  String continentName;

  @HiveField(5)
  String capital;

  @HiveField(6)
  String currency;

  @HiveField(7)
  String emoji;

  CountryHiveModel({
    required this.capital,
    required this.code,
    required this.continentCode,
    required this.continentName,
    required this.currency,
    required this.emoji,
    required this.name,
    required this.phone,
  });
}