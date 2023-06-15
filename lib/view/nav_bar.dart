import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/base/consts.dart';
import 'package:weatherapp/view/nav_bar_view_model.dart';

class NavBar extends StatefulWidget {
  const NavBar({
    super.key,
    required this.infoList,
  });
  final List<Map<String, dynamic>> infoList;
  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends Const<NavBar> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> infoList = widget.infoList;
    return CurvedNavigationBar(
      color: theme.primaryColor,
      backgroundColor: theme.cardColor,
      items: const [Icon(Icons.info_outline)],
      onTap: (_) => showModalBottomSheet(
          context: context,
          backgroundColor: theme.primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          builder: (context) => Padding(
                padding: const EdgeInsets.all(20.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    height: dynamicHeight(0.40),
                    width: dynamicWidth(0.3),
                    color: theme.primaryColor,
                    child: ListView.builder(
                      itemCount: infoList.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: SizedBox(
                            width: dynamicWidth(0.3),
                            child: ListTile(
                              leading: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  NavViewModel().iconList[index],
                                  size: 30,
                                ),
                              ),
                              title: Text('${infoList[index].keys}'),
                              subtitle: Text('${infoList[index].values}'),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )),
    );
  }
}
