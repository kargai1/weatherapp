import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:weatherapp/base/theme_data.dart';
import 'package:weatherapp/view/page_builder.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeDatas().lightMode,
      debugShowCheckedModeBanner: false,
      home: const PageBuilder(),
    );
  }
}