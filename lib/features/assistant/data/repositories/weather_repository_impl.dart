import 'package:dartz/dartz.dart';
import 'package:syria_glow/core/errors/dio_error_handler.dart';
import 'package:syria_glow/core/errors/failure.dart';
import 'package:syria_glow/features/assistant/data/datasources/weather_remote_data_source.dart';
import 'package:syria_glow/features/assistant/data/models/weather_model.dart';
import 'package:syria_glow/features/assistant/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  const WeatherRepositoryImpl({required this.weatherRemoteDataSource});
  final WeatherRemoteDataSource weatherRemoteDataSource;

  @override
  Future<Either<Failure, WeatherModel>> getWeatherForecast(
    String cityQuery,
    String langCode,
  ) async {
    try {
      final response = await weatherRemoteDataSource.getWeatherForecast(
        cityQuery,
        langCode,
      );
      return right(response);
    } catch (e) {
      return left(DioErrorHandler.handle(e));
    }
  }
}
