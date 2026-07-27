import 'package:dio/dio.dart';
import 'package:syria_glow/core/networking/api_constants.dart';

class DioFactory {
  Dio? _dio;

  Dio getDio() {
    if (_dio == null) {
      BaseOptions baseOptions = BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      _dio = Dio(baseOptions);

      // if (_dio != null && kDebugMode) {
      //   _dio!.interceptors.add(
      //     LogInterceptor(
      //       requestHeader: true,
      //       requestBody: true,
      //       responseBody: true,
      //       error: true,
      //     ),
      //   );
      // }
    }
      return _dio!;
  }
}
