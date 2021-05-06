import 'package:dio/dio.dart';

class DioService {

  Dio dio;

  static final DioService _singleton = DioService._internal();

  factory DioService() {
    return _singleton;
  }

  DioService._internal() {
    dio = Dio();
  }
}