import 'package:flutter/material.dart';
import 'package:udemy_coupons/data/data.dart';
import 'package:udemy_coupons/screens/profile_page/profile_page.dart';
import 'package:udemy_coupons/screens/setting_page/setting_page.dart';
import 'package:udemy_coupons/size_config.dart';

import 'home_page_one.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
  }) : super(key: key);
  static int curIndex = 0;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // ignore: prefer_final_fields
  late List _pages = [HomePageOne(), const ProfilePage(), SettingPage()];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: _pages[MyHomePage.curIndex],
      ),
      bottomNavigationBar: Container(
        height: getHeight(70),
        decoration: const BoxDecoration(
          color: Colors.red,
        ),
        child: BottomNavigationBar(
          currentIndex: MyHomePage.curIndex,
          selectedItemColor: const Color(0xffE3562A),
          onTap: (v) {
            setState(() {
              MyHomePage.curIndex = v;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.book), label: "Courses"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Settings"),
          ],
        ),
      ),
    );
  }
}
