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

  Future<Response<dynamic>> post(
      {required String endPoint, required Map<String, dynamic> data}) async {
    var response = await _dio.post(endPoint, data: data);
    return response;
  }

  Future<Response<dynamic>> put(
      {required String endPoint, required Map<String, dynamic> data}) async {
    var response = await _dio.put(endPoint, data: data);
    return response;
  }
}
