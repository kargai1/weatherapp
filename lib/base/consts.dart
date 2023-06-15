import 'package:flutter/material.dart';

abstract class Const<T extends StatefulWidget> extends State<T> {
  ThemeData get themeData => Theme.of(context);

  double dynamicHeight(double value) =>
      MediaQuery.of(context).size.height * value;
  double dynamicWidth(double value) =>
      MediaQuery.of(context).size.width * value;

  ThemeData get theme => Theme.of(context);
  String iconProvider(url) => 'https://openweathermap.org/img/wn/$url@2x.png';
}
