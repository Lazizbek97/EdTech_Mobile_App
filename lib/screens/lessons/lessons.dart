import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:udemy_coupons/data/data.dart';
import 'package:udemy_coupons/models/model_udemy.dart';

import '../../size_config.dart';

class LessonsPage extends StatefulWidget {
  LessonsPage({Key? key, required this.data}) : super(key: key);
  ModelUdemy data;
  @override
  _LessonsPageState createState() => _LessonsPageState();
}

class _LessonsPageState extends State<LessonsPage> {
  final PageController _controllerPage = PageController(initialPage: 0);
  int pageNum = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                      // width: getWidth(320),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Secsion 1",
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
              Container(
                height: getHeight(140),
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      widget.data.title.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0),
                    ),
                    const Text("3 of 11 Sections"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              pageNum = 0;
                              _controllerPage.jumpToPage(pageNum);
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              "Lessons",
                              style: pageNum == 0
                                  ? const TextStyle(fontWeight: FontWeight.bold)
                                  : const TextStyle(
                                      fontWeight: FontWeight.normal),
                            ),
                            height: 50,
                            width: getWidth(100),
                            decoration: const BoxDecoration(
                              color: Color(0xffF8F2EE),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                bottomLeft: Radius.circular(25),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              pageNum = 1;
                              _controllerPage.jumpToPage(pageNum);
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              "Tests",
                              style: pageNum == 1
                                  ? const TextStyle(fontWeight: FontWeight.bold)
                                  : const TextStyle(
                                      fontWeight: FontWeight.normal),
                            ),
                            height: 50,
                            width: getWidth(100),
                            decoration: const BoxDecoration(
                              color: Color(0xffF8F2EE),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              pageNum = 2;
                              _controllerPage.jumpToPage(pageNum);
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              "Discuss",
                              style: pageNum == 2
                                  ? const TextStyle(fontWeight: FontWeight.bold)
                                  : const TextStyle(
                                      fontWeight: FontWeight.normal),
                            ),
                            height: 50,
                            width: getWidth(100),
                            decoration: const BoxDecoration(
                              color: Color(0xffF8F2EE),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(25),
                                bottomRight: Radius.circular(25),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  height: getHeight(540),
                  child: PageView(
                    controller: _controllerPage,
                    onPageChanged: (v) {
                      pageNum = v;
                      setState(() {});
                    },
                    children: [
                      PageLessonOne(
                          data: widget.data), //? widget down here on the page
                      TestsPageWidget(
                        data: widget.data,
                      ),
                      DiscussLessons(),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

// * Discuss page
class DiscussLessons extends StatefulWidget {
  const DiscussLessons({Key? key}) : super(key: key);

  @override
  _DiscussLessonsState createState() => _DiscussLessonsState();
}

class _DiscussLessonsState extends State<DiscussLessons> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey, width: 1.2),
        ),
        alignment: Alignment.bottomCenter,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: myComments.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 4),
                      height: 60,
                      padding: const EdgeInsets.only(left: 60),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.grey, width: 1),
                        ),
                        child: Text(
                          myComments[index],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    );
                  }),
            ),
            TextFormField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: "Type here...",
                suffixIcon: IconButton(
                  onPressed: () {
                    myComments.add(_textController.text);
                    _textController.clear();
                    setState(() {});
                  },
                  icon: const Icon(Icons.send),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.grey, width: 1.2),
                ),
              ),
            ),
          ],
        ));
  }
}

// * Page Tests
class TestsPageWidget extends StatelessWidget {
  TestsPageWidget({Key? key, required this.data}) : super(key: key);
  ModelUdemy data;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              height: getHeight(463),
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey, width: 1.2),
              ),
              child: Column(
                children: [
                  Container(
                    height: getHeight(200),
                    padding: const EdgeInsets.all(10),
                    child: Center(
                        child: Image.asset(
                      "assets/images/nocourse.png",
                      fit: BoxFit.cover,
                    )),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Quiz ${index + 1}",
                            style: const TextStyle(color: Colors.red),
                          ),
                          const Text(
                            "Introductiction",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18.0),
                          ),
                          const Text(
                            "Let's put your memort on this topic test. solve tasks and check your knowledge.",
                            style:
                                TextStyle(color: Colors.grey, fontSize: 15.0),
                          ),
                          Center(
                            child: SizedBox(
                              height: getHeight(56),
                              width: getWidth(209),
                              child: ElevatedButton(
                                onPressed: () {},
                                child: const Text(
                                  "Begin",
                                  style: TextStyle(color: Colors.black),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent,
                                  elevation: 0,
                                  shadowColor: const Color(0xffE3562A),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(13),
                                    side: const BorderSide(
                                      color: Color(0xffE3562A),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}

// * Page Lessons

class PageLessonOne extends StatelessWidget {
  PageLessonOne({Key? key, required this.data}) : super(key: key);

  ModelUdemy data;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(497),
      width: getWidth(343),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/lessonIntro.png"),
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: getHeight(320),
            padding: EdgeInsets.symmetric(
              horizontal: getWidth(15),
              vertical: getHeight(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Introduction",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    data.whatYouWillLearn.toString(),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
