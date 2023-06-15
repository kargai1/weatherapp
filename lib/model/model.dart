import 'package:flutter/material.dart';

class PageModel {
  final InformationModel infoModel;
  final DailyCardsModel dailyModel;
  final HourlyWeather hourlyWeather;

  PageModel(this.infoModel, this.dailyModel, this.hourlyWeather);
}

class HourlyWeather {
  final List hourlyTemp;
  final List iconList;
  final List hourList;

  HourlyWeather.fromJsonToList(
      Map json, this.hourlyTemp, this.iconList, this.hourList) {
    for (int i = 0; i < 8; i++) {
      hourlyTemp.add(json['list'][i]["main"]['temp']);
      iconList.add(json['list'][i]["weather"][0]['icon']);
      hourList.add(json['list'][i]["dt_txt"]);
    }
  }
}

class InformationModel with ChangeNotifier {
  late final String weather;
  late final feelsLike;
  late final minTemp;
  late final maxTemp;
  late final windSpeed;
  late final int hummidity;
  late final int pressure;
  late final String city;
  late final temp;
  late final String icon;

  InformationModel.fromJson(Map json) {
    weather = json['list'][0]['weather'][0]["description"];
    feelsLike = json['list'][0]['main']["feels_like"];
    minTemp = json['list'][0]['main']["temp_min"];
    maxTemp = json['list'][0]['main']["temp_max"];
    windSpeed = json['list'][0]['wind']["speed"];
    hummidity = json['list'][0]['main']["humidity"];
    pressure = json['list'][0]['main']["pressure"];
    city = json['city']['name'];
    temp = json['list'][0]["main"]['temp'];
    icon = json['list'][0]["weather"][0]['icon'];
  }
}

class DailyCardsModel {
  final List dailyTempList;
  final List<String> dateList;
  final List<String> icon;

  DailyCardsModel(this.dailyTempList, this.dateList, this.icon);

  DailyCardsModel.fromJsonToList(
      Map json, this.dailyTempList, this.dateList, this.icon) {
    for (int i = 0; i < 40; i += 8) {
      dailyTempList.add(json['list'][i]["main"]['temp']);
      dateList.add(json['list'][i]["dt_txt"]);
      icon.add(json['list'][i]["weather"][0]['icon']);
    }
  }
}
