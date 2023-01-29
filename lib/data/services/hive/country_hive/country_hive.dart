import 'package:flutter_contest/data/services/hive/country_hive/models/country_hive_model.dart';
import 'package:flutter_contest/presentation/utils/constants/hive_keys.dart';
import 'package:hive/hive.dart';

class DownloadedBooksHive {
  static Box<CountryHiveModel> getCountries() =>
      Hive.box<CountryHiveModel>(HiveKeys.countryBox);

  static Future clearBox() async {
    final countries = getCountries();
    await countries.clear();
  }

  static void updateValues(CountryHiveModel countryHiveModel) async {
    await clearBox();
  
  }
}
