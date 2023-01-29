import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_contest/presentation/utils/constants/api_keys.dart';

import 'custom_exceptions.dart';

class ApiClient {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiKeys.BASE_URL,
      connectTimeout: 25000,
      receiveTimeout: 20000,
    ),
  );

  ApiClient() {
    _init();
  }

  Future _init() async {
    dio.interceptors.add(
      (InterceptorsWrapper(
        onError: (error, handler) async {
          debugPrint("Entered to Error");
          switch (error.type) {
            case DioErrorType.connectTimeout:
            case DioErrorType.sendTimeout:
            case DioErrorType.receiveTimeout:
              throw DeadlineExceededException(error.requestOptions);
            case DioErrorType.response:
              switch (error.response?.statusCode) {
                case 400:
                  throw BadRequestException(error.response?.data['message']);
                case 401:
                  throw UnauthorizedException(error.requestOptions);
                case 404:
                  throw NotFoundException(error.requestOptions);
                case 409:
                  throw ConflictException(error.requestOptions);
                case 500:
                  throw InternalServerErrorException(error.requestOptions);
              }
              break;
            case DioErrorType.cancel:
              break;
            case DioErrorType.other:
              throw NoInternetConnectionException(error.requestOptions);
          }
          debugPrint('Error Status Code:${error.response?.statusCode}');
          return handler.next(error);
        },
        onRequest: (requestOptions, handler) {
          debugPrint("ON REQUESTGA KIRDI");
          requestOptions.headers["Accept"] = "application/json";
          return handler.next(requestOptions);
        },
        onResponse: (response, handler) async {
          debugPrint("ON RESPONSEGA KIRDI");
          return handler.next(response);
        },
      )),
    );
  }
}
