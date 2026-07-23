import 'package:dartz/dartz.dart';
import 'package:syria_glow/core/errors/failure.dart';
import 'package:syria_glow/features/assistant/data/models/weather_model.dart';

abstract class WeatherRepository {
   Future<Either<Failure,WeatherModel>> getWeatherForecast(String cityQuery, String langCode);
}