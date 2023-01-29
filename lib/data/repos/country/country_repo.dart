import 'package:flutter_contest/data/models/countries/countries_model.dart';
import 'package:flutter_contest/data/services/api/api_service.dart';

class CountryRepo {
  CountryRepo({required ApiService apiService}) : _apiService = apiService;
  final ApiService _apiService;

  Future<List<CountriesModel>> getCountries() async =>
      _apiService.getCountries();
}
