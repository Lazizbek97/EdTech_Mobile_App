import 'package:flutter/material.dart';
import 'package:udemy_coupons/data/data.dart';
import 'package:udemy_coupons/models/model_udemy.dart';
import 'package:udemy_coupons/screens/home_page/widgets/course.dart';
import 'package:udemy_coupons/services/serviceUdemy.dart';

import '../../size_config.dart';
import 'widgets/category.dart';

class HomePageOne extends StatelessWidget {
  static List<ModelUdemy>? datam;
  User aUser = users.last;

  HomePageOne({
    Key? key,
  }) : super(key: key);

  @override
  void initState() {
    ServiceUdemy.fetchData().then((value) => datam = value);
  }

  @override
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
                        Text(
                          "Hello",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          aUser.name,
                          style: TextStyle(
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
                            arguments: datam);
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
        const Expanded(child: Course())
      ],
    );
  }
}
