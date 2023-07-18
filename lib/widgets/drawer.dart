import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/base/consts.dart';
import 'package:weatherapp/base/service.dart';

import '../controller/controller.dart';

class DrawerBar extends StatefulWidget {
  const DrawerBar({super.key, required this.pageList});

  final List<dynamic> pageList;

  @override
  State<DrawerBar> createState() => _DrawerBarState();
}

class _DrawerBarState extends Const<DrawerBar> {
  final Controller _controller = Get.find();
  TextEditingController cityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    List<dynamic> pageList = widget.pageList;
    return Drawer(
      backgroundColor: theme.primaryColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const DrawerHeader(
              child: Icon(
            Icons.home_outlined,
            size: 100,
          )),
          Obx(() => SizedBox(
                height: dynamicHeight(0.4),
                child: ListView.builder(
                  itemCount: pageList.length,
                  itemBuilder: (context, index) => Card(
                    shadowColor: theme.cardColor,
                    color: theme.primaryColor,
                    elevation: 5,
                    child: ListTile(
                      leading: Image.network(
                        iconProvider(pageList[index].infoModel.icon),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.remove_circle_outline),
                        onPressed: () {
                          _controller.deleteCity(
                              pageList[index], _controller.cityList[index]);
                        },
                      ),
                      title: Text(pageList[index].infoModel.city,
                          style: const TextStyle(fontSize: 25)),
                      subtitle: Text(
                        '${pageList[index].infoModel.temp} C°',
                        style: const TextStyle(fontSize: 17),
                      ),
                    ),
                  ),
                ),
              )),
          Divider(
            color: theme.cardColor,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: cityController,
              decoration: InputDecoration(
                  fillColor: theme.canvasColor,
                  hintText: 'Add New City',
                  prefixIcon: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () async {
                      var x =
                          await GetData().getForecastData(cityController.text);
                      if (x == null) {
                        Get.snackbar('Something Went Wrong!',
                            'There is no information about the city.',
                            backgroundColor: theme.canvasColor);
                      } else {
                        _controller.addNewCity(cityController.text);
                      }
                    },
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
        ],
      ),
    );
  }
}
