import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  const ApiService({required this.dio});

  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    final response = await dio.get(
      path,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
    return response.data;
  }

  Future<dynamic> post(
    String path, {
    Object? body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    final response = await dio.post(
      path,
      data: body,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
    return response.data;
  }

  Future<dynamic> put(
    String path, {
    Object? body,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await dio.put(
      path,
      data: body,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
    return response.data;
  }

  Future<dynamic> delete(
    String path, {
    Object? body,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await dio.delete(
      path,
      queryParameters: queryParameters,
      data: body,
      options: Options(headers: headers),
    );
    return response.data;
  }
}
