import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../size_config.dart';

class NoDataFound extends StatelessWidget {
  NoDataFound({
    Key? key,
    required this.title,
    required this.text1,
    required this.text2,
    required this.imgLink,
    required this.buttonText,
  }) : super(key: key);

  String title;
  String text1;
  String text2;
  String buttonText;
  String imgLink;

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
        title: Text(
          title,
          style: const TextStyle(fontSize: 27),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(20, 130, 20, 50),
        height: getHeight(455),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(imgLink),
            Text(
              text1,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
            SizedBox(
              width: getWidth(200),
              height: getHeight(100),
              child: Text(
                text2,
                style: const TextStyle(
                    height: 1.5,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: getHeight(56),
              width: getWidth(309),
              child: ElevatedButton(
                onPressed: () {},
                child: Text(buttonText),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xffE3562A),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
