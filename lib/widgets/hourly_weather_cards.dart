import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/base/consts.dart';
import 'package:weatherapp/model/model.dart';

import '../controller/controller.dart';

class HourlyCards extends StatefulWidget {
  const HourlyCards({super.key, required this.hourlyWeather});
  final HourlyWeather hourlyWeather;

  @override
  State<HourlyCards> createState() => _HourlyCardsState();
}

class _HourlyCardsState extends Const<HourlyCards> {
  @override
  Widget build(BuildContext context) {
    HourlyWeather hourlyWeather = widget.hourlyWeather;
    return SizedBox(
      width: dynamicWidth(0.8),
      child: ListView.builder(
          itemCount: 8,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(top: 4, left: 20, right: 20),
              child: Card(
                child: ListTile(
                  leading: Image.network(
                      iconProvider(hourlyWeather.iconList[index])),
                  title: Intl.withLocale(
                      'fr',
                      () => Text(DateFormat().format(
                          DateTime.parse(hourlyWeather.hourList[index])))),
                  subtitle: Text('${hourlyWeather.hourlyTemp[index]} C°'),
                ),
              ),
            );
          }),
    );
  }
}
