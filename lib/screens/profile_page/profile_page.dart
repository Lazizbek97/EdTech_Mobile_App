import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:udemy_coupons/data/data.dart';
import 'package:udemy_coupons/screens/home_page/myhomePage.dart';
import 'package:udemy_coupons/size_config.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        leadingWidth: getWidth(80),
        leading: InkWell(
          onTap: () {
            MyHomePage.curIndex = 0;
            setState(() {});
          },
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: SvgPicture.asset("assets/images/back.svg"),
          ),
        ),
        title: const Text(
          "Profile",
          style: TextStyle(fontSize: 27),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            Center(
              child: SizedBox(
                child: Image.asset("assets/images/Avatar.png"),
              ),
            ),
            InkWell(
              onTap: () {
                if (myCourses.isEmpty) {
                  Navigator.pushNamed(context, "/saved", arguments: [
                    "Courses",
                    "No courses yet",
                    "You don't have any course yet",
                    "assets/images/nocourse.png",
                    "Continue"
                  ]);
                } else {
                  Navigator.pushNamed(context, "/myCourses");
                }
              },
              child: Container(
                height: getHeight(80),
                width: getWidth(320),
                alignment: Alignment.center,
                child: const Text(
                  "Your Courses",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey, width: 1)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: InkWell(
                onTap: () {
                  if (mySaved.isEmpty) {
                    Navigator.pushNamed(context, "/saved", arguments: [
                      "Saved",
                      "Course not saved",
                      "Try saving the course again in a few minutes",
                      "assets/images/nosaved.png",
                      "Continue"
                    ]);
                  } else {
                    Navigator.pushNamed(context, "/mySaved");
                  }
                },
                child: Container(
                  height: getHeight(80),
                  width: getWidth(320),
                  alignment: Alignment.center,
                  child: const Text(
                    "Saved",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey, width: 1)),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/saved", arguments: [
                  "Payment",
                  "No payment method",
                  "You don't have any payment method",
                  "assets/images/nopayment.png",
                  "Continue"
                ]);
              },
              child: Container(
                height: getHeight(80),
                width: getWidth(320),
                alignment: Alignment.center,
                child: const Text(
                  "Payment",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey, width: 1)),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                "Log out",
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
