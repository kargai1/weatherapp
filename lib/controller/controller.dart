import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../model/model.dart';
import '../base/service.dart';

class Controller extends GetxController {
  List cityList = ['İstanbul'].obs;
  final box = GetStorage();

  late RxList pageList = [].obs;
  Rx<ThemeData> selectedTheme = ThemeData.dark().obs;

  void addNewCity(String city) async {
    cityList.add(city);

    await getModelData();
    box.write('citylist', cityList);
  }

  void deleteCity(PageModel pageModel, String city) {
    if (pageList.length < 2) {
    } else {
      pageList.remove(pageModel);
      cityList.remove(city);

      box.write('citylist', cityList);
    }
  }

  getModelData() async {
    for (int i = cityList.length - 1; i < cityList.length; i++) {
      if (await GetData().getForecastData(cityList[i]) == null) {
      } else {
        box.write('citylist', cityList);
        cityList = box.read('citylist');

        pageList.add(await GetData().getForecastData(cityList[i]));
      }
    }
  }

  List<Map<String, dynamic>> infoModelToList(InformationModel info) {
    List<Map<String, dynamic>> infoList = [];
    infoList = [
      {'Description': info.weather},
      {'Minimum Temp': info.minTemp},
      {'Maximum Temp': info.maxTemp},
      {'Pressure': info.pressure},
      {'Hummidity': info.hummidity},
      {'Wind Speed': info.windSpeed},
    ];

    return infoList;
  }
}
