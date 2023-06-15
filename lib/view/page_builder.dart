import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/view/weather_page.dart';
import '../controller/controller.dart';

class PageBuilder extends StatefulWidget {
  const PageBuilder({super.key});

  @override
  State<PageBuilder> createState() => _PageBuilderState();
}

class _PageBuilderState extends State<PageBuilder> {
  final Controller _controller = Get.put(Controller());

  void setModelData() async {
    await _controller.getModelData();
  }

  @override
  void initState() {
    setModelData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => PageView.builder(
          itemCount: _controller.pageList.length,
          itemBuilder: (context, index) {
            return (_controller.pageList[index] == null)
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : WeatherPage(
                    pageList: _controller.pageList,
                    pageModel: _controller.pageList[index],
                  );
          },
        ));
  }
}
