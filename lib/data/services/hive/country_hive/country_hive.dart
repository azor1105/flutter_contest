import 'package:flutter_contest/data/models/countries/countries_model.dart';
import 'package:flutter_contest/data/services/hive/country_hive/models/country_hive_model.dart';
import 'package:flutter_contest/presentation/utils/constants/hive_keys.dart';
import 'package:hive/hive.dart';

class CountryHiveService {
  static Box<CountryHiveModel> getCountries() =>
      Hive.box<CountryHiveModel>(HiveKeys.countryBox);

  static Future clearBox() async {
    final countries = getCountries();
    await countries.clear();
  }

  static Future<void> updateValues(List<CountriesModel> countries) async {
    await clearBox();
    final countryBox = getCountries();
    for (int i = 0; i < countries.length; i++) {
      CountryHiveModel countryHive = CountryHiveModel(
        capital: countries[i].capital,
        code: countries[i].countryCode,
        continentCode: countries[i].continent.code,
        continentName: countries[i].continent.name,
        currency: countries[i].currency,
        emoji: countries[i].emoji,
        name: countries[i].name,
        phone: countries[i].phone,
      );
      countryBox.add(countryHive);
    }
  }
}
