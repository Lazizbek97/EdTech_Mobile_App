import 'package:flutter/material.dart';
import 'package:udemy_coupons/size_config.dart';
import 'package:dots_indicator/dots_indicator.dart';

// * About App Pages

class AboutApplication extends StatefulWidget {
  const AboutApplication({Key? key}) : super(key: key);

  @override
  _AboutApplicationState createState() => _AboutApplicationState();
}

class _AboutApplicationState extends State<AboutApplication> {
  // ?PageView Controller
  PageController controller = PageController(
    initialPage: 0,
  );
  // ?Dots current position
  double dotsPosition = 0;

  // ? PageView Datas
  final List _data = [
    {
      "image": "assets/images/il1.png",
      "text1": "Learn anytime and anywhere",
      "text2":
          "Quarantine is the perfect time to spend your day learning something new, from anywhere!",
    },
    {
      "image": "assets/images/il2.png",
      "text1": "Find a course for you",
      "text2":
          "Quarantine is the perfect time to spend your day learning something new, from anywhere!",
    },
    {
      "image": "assets/images/il3.png",
      "text1": "Improve your skills",
      "text2":
          "Quarantine is the perfect time to spend your day learning something new, from anywhere!",
    },
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, "/signIn", (route) => false);
            },
            child: const Text(
              "Skip",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 10),
              child: PageView.builder(
                controller: controller,
                itemBuilder: (context, index) {
                  return PageViews(
                    img: _data[index]['image'],
                    text1: _data[index]['text1'],
                    text2: _data[index]['text2'],
                  );
                },
                itemCount: 3,
                onPageChanged: (v) {
                  dotsPosition = v.toDouble();
                  setState(() {});
                },
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                DotsIndicator(
                  dotsCount: 3,
                  position: dotsPosition,
                  decorator: DotsDecorator(
                    size: const Size.square(9.0),
                    activeSize: const Size(18.0, 9.0),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        width: getHeight(350),
        height: getWidth(50),
        margin: EdgeInsets.only(bottom: getHeight(20)),
        child: FloatingActionButton(
          onPressed: () {
            dotsPosition == 2.0
                ? Navigator.pushNamedAndRemoveUntil(
                    context, "/signIn", (route) => false)
                : controller.nextPage(
                    duration: Duration(milliseconds: 300), curve: Curves.ease);
          },
          child: dotsPosition == 2.0
              ? const Text("Let's start")
              : const Text("Next"),
          backgroundColor: const Color(0xffE3562A),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

// * PageView changing Model

class PageViews extends StatelessWidget {
  PageViews({
    Key? key,
    required this.img,
    required this.text1,
    required this.text2,
  }) : super(key: key);

  String img;
  String text1;
  String text2;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(img),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
          child: Text(
            text1,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23.0,
                color: Colors.black87,
                letterSpacing: 1.2),
            textAlign: TextAlign.center,
          ),
        ),
        Text(
          text2,
          style: const TextStyle(
            fontSize: 16.0,
            color: Colors.black87,
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
