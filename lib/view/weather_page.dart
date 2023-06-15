import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/base/consts.dart';
import 'package:weatherapp/controller/controller.dart';
import 'package:weatherapp/model/model.dart';
import 'package:weatherapp/widgets/drawer.dart';
import 'package:weatherapp/widgets/hourly_weather_cards.dart';

import '../widgets/daily_weather_cards.dart';
import 'nav_bar.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage(
      {super.key, required this.pageModel, required this.pageList});
  final PageModel pageModel;
  final List pageList;

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends Const<WeatherPage> {
  final Controller _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    PageModel pageModel = widget.pageModel;
    List pageList = widget.pageList;
    return Scaffold(
      drawer: DrawerBar(
        pageList: pageList,
      ),
      backgroundColor: theme.primaryColor,
      appBar: AppBar(
        elevation: 0,
      ),
      bottomNavigationBar: NavBar(
        infoList: _controller.infoModelToList(pageModel.infoModel),
      ),
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: dynamicHeight(0.9),
            width: dynamicWidth(0.875),
            color: theme.cardColor,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: dynamicHeight(0.01),
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => HourlyCards(
                          hourlyWeather: pageModel.hourlyWeather,
                        ),
                      );
                    },
                    child: Card(
                      elevation: 5,
                      shadowColor: theme.shadowColor,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Column(
                        children: [
                          SizedBox(
                            height: dynamicHeight(0.1),
                          ),
                          // City Name (Header)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              pageModel.infoModel.city,
                              style: const TextStyle(fontSize: 40),
                            ),
                          ),

                          //Degree and Icon
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '${pageModel.infoModel.temp} C°',
                                  style: TextStyle(fontSize: 40),
                                ),
                              ),
                              Image.network(
                                  iconProvider(pageModel.infoModel.icon)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  //Daily Cards
                  DailyWeatherCards(
                    pageModel: pageModel,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
