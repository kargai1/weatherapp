import 'package:flutter/material.dart';

class ThemeDatas {
  ThemeData lightMode = ThemeData(
      appBarTheme: const AppBarTheme(color: Colors.transparent),
      shadowColor: Colors.deepPurple[300],
      cardColor: Colors.blueGrey[100],
      primaryColor: Colors.blueGrey[300],
      canvasColor: Colors.blueGrey[200]);

  ThemeData disco = ThemeData(
      appBarTheme: const AppBarTheme(color: Colors.transparent),
      shadowColor: Colors.deepPurple[400],
      cardColor: Colors.indigo[100],
      primaryColor: Colors.deepPurple[300],
      canvasColor: Colors.indigo[100]);
}
