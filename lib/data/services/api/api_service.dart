

import 'package:dio/dio.dart';
import 'package:flutter_contest/data/models/countries/countries_model.dart';
import 'package:flutter_contest/presentation/utils/constants/api_keys.dart';

class ApiService {
  Dio dio = Dio();
  Future<List<CountriesModel>> getCountries() async {
    try {
      Response response = await dio.get(
        "${ApiKeys.BASE_URL}/countries",
       
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        return (response.data["countries"] as List?)
                ?.map((data) => CountriesModel.fromJson(data))
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
