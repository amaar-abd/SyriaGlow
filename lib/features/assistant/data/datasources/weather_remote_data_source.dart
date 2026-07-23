import 'package:dio/dio.dart';
import 'package:syria_glow/core/networking/weather_api_constants.dart';
import 'package:syria_glow/features/assistant/data/models/weather_model.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getWeatherForecast(String cityQuery, String langCode);
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final Dio dio;

  WeatherRemoteDataSourceImpl({required this.dio});

  @override
  Future<WeatherModel> getWeatherForecast(
    String cityQuery,
    String langCode,
  ) async {
    
    final url =
        '${WeatherApiConstants.baseUrl}${WeatherApiConstants.forecast}?key=${WeatherApiConstants.apikey}&q=$cityQuery&days=7&lang=$langCode';

    final response = await dio.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = response.data as Map<String, dynamic>;
      return WeatherModel.fromJson(data);
    } else {
      throw Exception('فشل في جلب البيانات: ${response.statusCode}');
    }
  }
}
