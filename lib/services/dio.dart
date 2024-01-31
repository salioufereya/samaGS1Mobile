import 'package:dio/dio.dart';

Dio dio() {
  Dio dio = Dio();
  dio.options.baseUrl = "http://192.168.1.13:8000/api";
  dio.options.headers['accept'] = "Application/Json";
  return dio;
}
