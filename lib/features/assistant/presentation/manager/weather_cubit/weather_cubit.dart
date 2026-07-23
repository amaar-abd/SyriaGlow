import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syria_glow/features/assistant/domain/repositories/weather_repository.dart';
import 'package:syria_glow/features/assistant/presentation/manager/weather_cubit/weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherCubit(this.weatherRepository) : super(WeatherInitialState());

  Future<void> fetchWeather({
    required String provinceQuery,
    required String langCode,
  }) async {
    emit(WeatherLoadingState());

    final weather = await weatherRepository.getWeatherForecast(
      provinceQuery,
      langCode,
    );
    weather.fold(
      (failure) => emit(WeatherErrorState(failure.message)),
      (weatherInfo) => emit(WeatherSuccessState(weatherInfo)),
    );
  }
}
