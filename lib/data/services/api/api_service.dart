import 'package:dio/dio.dart';
import 'package:flutter_contest/data/models/countries/countries_model.dart';
import 'package:flutter_contest/data/services/api/api_client.dart';

class ApiService {
  ApiService(ApiClient apiClient) : _apiClient = apiClient;

  final ApiClient _apiClient;

  Future<List<CountriesModel>> getCountries() async {
    try {
      Response response = await _apiClient.dio.get(
        "${_apiClient.dio.options.baseUrl}/countries",
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        return (response.data['data']["countries"] as List?)
                ?.map(
                  (data) => CountriesModel.fromJson(data),
                )
                .toList() ??
            [];
      } else {
        return [];
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
