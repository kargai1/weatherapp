import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/model.dart';

class GetData {
  Future getForecastData(String city) async {
    var locationData = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=75bbece187da05fa4343b25bdb8521fb&lang=tr&units=metric'));
    if (locationData.statusCode == 200) {
      final locationDataParsed = jsonDecode(locationData.body);
      List hourlyTemp = [];
      List iconList = [];
      List hourList = [];
      List dailyWeatherList = [];
      List<String> dateList = [];
      List<String> icon = [];
      HourlyWeather hourlyWeather = HourlyWeather.fromJsonToList(
          locationDataParsed, hourlyTemp, iconList, hourList);
      InformationModel infoModel =
          InformationModel.fromJson(locationDataParsed);

      DailyCardsModel dailyModel = DailyCardsModel.fromJsonToList(
          locationDataParsed, dailyWeatherList, dateList, icon);

      PageModel model = PageModel(infoModel, dailyModel, hourlyWeather);
      return model;
    } else {
      return null;
    }
  }
}
