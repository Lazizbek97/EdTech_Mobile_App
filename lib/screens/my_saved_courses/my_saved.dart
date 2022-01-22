import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:udemy_coupons/data/data.dart';

import '../../size_config.dart';

class MySaved extends StatefulWidget {
  const MySaved({Key? key}) : super(key: key);

  @override
  _MySavedState createState() => _MySavedState();
}

class _MySavedState extends State<MySaved> {
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
            Navigator.pop(context);
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
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/about",
                    arguments: mySaved[index]);
              },
              child: Container(
                height: getHeight(297),
                width: getWidth(343),
                margin: EdgeInsets.symmetric(
                  horizontal: getWidth(20),
                  vertical: getHeight(5),
                ),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    mySaved[index].thumbnail.toString()),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            right: 10,
                            child: Opacity(
                              opacity: 0.8,
                              child: Chip(
                                label: const Text(
                                  "Hot Sale",
                                  style: TextStyle(color: Colors.white),
                                ),
                                backgroundColor: Colors.red.shade100,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: getHeight(100),
                      padding: EdgeInsets.symmetric(
                        horizontal: getWidth(15),
                        vertical: getHeight(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          RichText(
                            text: TextSpan(children: [
                              const TextSpan(
                                  text: "Last Update:  ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                      color: Colors.black)),
                              TextSpan(
                                text: formatedData(
                                  mySaved[index].lastUpdated.toString(),
                                ),
                                style: const TextStyle(
                                  color: Color(0xff5BA092),
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ]),
                          ),
                          Text(
                            mySaved[index].category![0],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25.0),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              mySaved[index].title.toString(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          itemCount: mySaved.length,
        ),
      ),
    );
  }

  formatedData(String date) {
    DateTime dateTime = DateTime.parse(date);
    return "${dateTime.year}-${dateTime.month}-${dateTime.day}";
  }
}
