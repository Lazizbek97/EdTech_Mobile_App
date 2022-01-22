import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:udemy_coupons/models/model_udemy.dart';

import '../../size_config.dart';

class CourseDetails extends StatefulWidget {
  CourseDetails({Key? key, required this.data}) : super(key: key);
  ModelUdemy data;
  @override
  _CourseDetailsState createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                height: getHeight(80),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.transparent,
                        child: SvgPicture.asset("assets/images/back.svg"),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          widget.data.title.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: getHeight(20),
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 20,
                          ),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return index == 0
                            ? Container(
                                height: getHeight(497),
                                width: getWidth(343),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
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
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(widget
                                                    .data.thumbnail
                                                    .toString()),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 10,
                                            right: 10,
                                            child: SvgPicture.asset(
                                                "assets/images/play.svg"),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: getHeight(120),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: getWidth(15),
                                        vertical: getHeight(10),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          RichText(
                                            text: TextSpan(children: [
                                              const TextSpan(
                                                  text: "Last Update:  ",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 10,
                                                      color: Colors.black)),
                                              TextSpan(
                                                text: formatedData(
                                                  widget.data.lastUpdated
                                                      .toString(),
                                                ),
                                                style: const TextStyle(
                                                  color: Color(0xff5BA092),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                            ]),
                                          ),
                                          Text(
                                            widget.data.category![0],
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25.0),
                                          ),
                                          SizedBox(
                                            width: double.infinity,
                                            child: Text(
                                              widget.data.title.toString(),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, "/lessons",
                                      arguments: widget.data);
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            color: Colors.grey, width: 1.2)),
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        backgroundColor: Colors.cyan,
                                        child: Text(
                                          (index).toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Colors.white),
                                        ),
                                      ),
                                      title: Text(
                                          "Section ${(index)} | About ${widget.data.title.toString()}"),
                                      subtitle: const Divider(
                                        color: Colors.green,
                                        thickness: 10,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                      })),
            ],
          ),
        ),
      ),
    );
  }

  formatedData(String date) {
    DateTime dateTime = DateTime.parse(date);
    return "${dateTime.year}-${dateTime.month}-${dateTime.day}";
  }
}
