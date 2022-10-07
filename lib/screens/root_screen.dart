import 'package:file_manager_ui/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../root_app_json.dart';
import 'files_screen.dart';
import 'home_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      bottomNavigationBar: getTabs(),
      body: getBody(),
    );
  }

  Widget getTabs() {
    return SalomonBottomBar(
        currentIndex: pageIndex,
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
        items: List.generate(rootAppJson.length, (index) {
          return SalomonBottomBarItem(
              selectedColor: rootAppJson[index]['color'],
              icon: SvgPicture.asset(
                rootAppJson[index]['icon'],
                color: rootAppJson[index]['color'],
              ),
              title: Text(rootAppJson[index]['text']));
        }));
  }

  Widget getBody(){
    return IndexedStack(
      index: pageIndex,
      children: [
        HomeScreen(),
        FilesScreen(),
        Center(
          child: Text("Trash Page",style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),),
        ),
        Center(
          child: Text("Account Page",style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),),
        )
      ],
    );
  }
}
