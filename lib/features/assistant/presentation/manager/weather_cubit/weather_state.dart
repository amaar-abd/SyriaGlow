import 'package:syria_glow/features/assistant/data/models/weather_model.dart';

abstract class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherSuccessState extends WeatherState {
  final WeatherModel weather;
  WeatherSuccessState(this.weather);
}

class WeatherErrorState extends WeatherState {
  final String errorMessage;
  WeatherErrorState(this.errorMessage);
}