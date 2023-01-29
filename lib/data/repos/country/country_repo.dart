import 'package:flutter_contest/data/models/countries/countries_model.dart';
import 'package:flutter_contest/data/services/api/api_service.dart';

class CountryRepo {
  ApiService apiService = ApiService();

  Future<List<CountriesModel>> getCountries ()async => apiService.getCountries();
}
