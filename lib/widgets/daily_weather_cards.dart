import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/base/consts.dart';
import 'package:weatherapp/model/model.dart';

class DailyWeatherCards extends StatefulWidget {
  const DailyWeatherCards({super.key, required this.pageModel});
  final PageModel pageModel;

  @override
  State<DailyWeatherCards> createState() => _DailyWeatherCardsState();
}

class _DailyWeatherCardsState extends Const<DailyWeatherCards> {
  @override
  Widget build(BuildContext context) {
    PageModel pageModel = widget.pageModel;
    return Card(
      elevation: 5,
      color: theme.cardColor,
      child: SizedBox(
        height: dynamicHeight(0.4),
        width: dynamicWidth(0.8),
        child: ListView.builder(
          itemCount: pageModel.dailyModel.dateList.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              shadowColor: theme.shadowColor,
              color: theme.primaryColor,
              elevation: 10,
              child: ListTile(
                leading: Card(
                  color: theme.cardColor,
                  child: Image.network(
                      iconProvider(pageModel.dailyModel.icon[index])),
                ),
                title: Text(DateFormat('EEEEE').format(
                    DateTime.parse(pageModel.dailyModel.dateList[index]))),
                subtitle:
                    Text('${pageModel.dailyModel.dailyTempList[index]} C°'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
