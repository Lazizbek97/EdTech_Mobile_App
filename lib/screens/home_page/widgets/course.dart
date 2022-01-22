import 'package:flutter/material.dart';
import 'package:udemy_coupons/models/model_udemy.dart';
import 'package:udemy_coupons/screens/home_page/home_page_one.dart';
import 'package:udemy_coupons/services/serviceUdemy.dart';

import '../../../size_config.dart';

class Course extends StatelessWidget {
  const Course({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ServiceUdemy.fetchData(),
      builder: (context, AsyncSnapshot snap) {
        if (!snap.hasData) {
          return const Center(child: CircularProgressIndicator());
        } else if (snap.hasError) {
          return const Text("Error 403");
        } else {
          List<ModelUdemy> data = snap.data;
          HomePageOne.datam = data;
          return ListView.builder(
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/about",
                      arguments: snap.data[index]);
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
                                      data[index].thumbnail.toString()),
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
                                    data[index].lastUpdated.toString(),
                                  ),
                                  style: const TextStyle(
                                    color: Color(0xff5BA092),
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ]),
                            ),
                            Text(
                              data[index].category![0],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25.0),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                data[index].title.toString(),
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
            itemCount: snap.data.length,
          );
        }
      },
    );
  }

  formatedData(String date) {
    DateTime dateTime = DateTime.parse(date);
    return "${dateTime.year}-${dateTime.month}-${dateTime.day}";
  }
}
