class WeatherModel {
  final String cityName;
  final double currentTemp;
  final String conditionText;
  final String conditionIcon;
  final int humidity;
  final double windKph;
  final List<ForecastDayModel> forecastDays;

  WeatherModel({
    required this.cityName,
    required this.currentTemp,
    required this.conditionText,
    required this.conditionIcon,
    required this.humidity,
    required this.windKph,
    required this.forecastDays,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    
    var forecastList = json['forecast']['forecastday'] as List;
    List<ForecastDayModel> forecastDays =
        forecastList.map((day) => ForecastDayModel.fromJson(day)).toList();

    return WeatherModel(
      cityName: json['location']['name'],
      currentTemp: json['current']['temp_c'].toDouble(),
      conditionText: json['current']['condition']['text'],
      conditionIcon: 'https:${json['current']['condition']['icon']}',
      humidity: json['current']['humidity'],
      windKph: json['current']['wind_kph'].toDouble(),
      forecastDays: forecastDays,
    );
  }
}

class ForecastDayModel {
  final String date;
  final double maxTemp;
  final double minTemp;
  final String conditionText;
  final String conditionIcon;

  ForecastDayModel({
    required this.date,
    required this.maxTemp,
    required this.minTemp,
    required this.conditionText,
    required this.conditionIcon,
  });

  factory ForecastDayModel.fromJson(Map<String, dynamic> json) {
    return ForecastDayModel(
      date: json['date'],
      maxTemp: json['day']['maxtemp_c'].toDouble(),
      minTemp: json['day']['mintemp_c'].toDouble(),
      conditionText: json['day']['condition']['text'],
      conditionIcon: 'https:${json['day']['condition']['icon']}',
    );
  }
}