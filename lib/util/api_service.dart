import 'package:dio/dio.dart';

class ApiService {
  // final _baseUrl = 'https://fakestoreapi.com/';
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://fakestoreapi.com/',
      connectTimeout: 50000,
      receiveTimeout: 30000,
      sendTimeout: 30000,
    ),
  );

  ApiService();

  Future<Response<dynamic>> get({required String endPoint}) async {
    var response = await _dio.get(endPoint);
    return response;
  }
}
