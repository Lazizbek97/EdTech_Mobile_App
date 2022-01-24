import 'package:flutter/material.dart';
import 'package:udemy_coupons/models/model_udemy.dart';
import 'package:udemy_coupons/models/model_users/model_user.dart';
import 'package:udemy_coupons/screens/home_page/widgets/course.dart';
import 'package:udemy_coupons/services/serviceUdemy.dart';
import 'package:udemy_coupons/widgets/hive_boxes.dart';

import '../../size_config.dart';
import 'widgets/category.dart';

class HomePageOne extends StatefulWidget {
  int userId;
  HomePageOne({Key? key, required this.userId}) : super(key: key);

  @override
  State<HomePageOne> createState() => _HomePageOneState();
}

class _HomePageOneState extends State<HomePageOne> {
  Users? curUser;

  List<ModelUdemy>? courses;

  // ? Data basani oldindan tekshiramiz agar malumotlar bo'lsa internetdagi api ga murojaat qilib o'tirmaymiz
  @override
  void initState() {
    curUser = UserBox.getUser().values.toList()[widget.userId];

    if (CourseBoxes.getCourse().values.isEmpty) {
      ServiceUdemy.fetchData().then((value) {
        for (var item in value) {
          CourseBoxes.getCourse().add(item);
        }
        courses = CourseBoxes.getCourse().values.toList();
      });
    } else {
      print("data basadan kelmoqda");
      courses = CourseBoxes.getCourse().values.toList();
    }
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: getHeight(192),
          width: getWidth(375),
          padding: EdgeInsets.symmetric(
              horizontal: getWidth(16), vertical: getHeight(5)),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          "Hello",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          curUser!.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/saved", arguments: [
                          "Saved",
                          "Course not saved",
                          "Try saving the course again in a few minutes",
                          "assets/images/nosaved.png",
                          "Continue"
                        ]);
                      },
                      child: const CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.black,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.bookmark_border),
                          radius: 21,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/search",
                            arguments: courses);
                      },
                      child: TextFormField(
                        enabled: false,
                        decoration: InputDecoration(
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide: const BorderSide(color: Colors.black54),
                          ),
                          hintText: "Search course",
                          suffixIcon: const Icon(
                            Icons.search,
                            size: 35.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          "Category:",
                          style: TextStyle(fontSize: 16.0),
                        ),
                        Category(
                          title: "CSS",
                        ),
                        Category(
                          title: "UI",
                        ),
                        Category(
                          title: "UX",
                        ),
                        Category(
                          title: "Swift",
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Expanded(
            child: Course(
          courses: courses,
        ))
      ],
    );
  }
}
