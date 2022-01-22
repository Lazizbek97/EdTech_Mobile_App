import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:udemy_coupons/data/data.dart';
import 'package:udemy_coupons/models/model_udemy.dart';
import 'package:udemy_coupons/size_config.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  AboutPage({Key? key, required this.data}) : super(key: key);

  ModelUdemy data;

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  bool isSaved = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                  InkWell(
                    onTap: () {
                      isSaved = !isSaved;
                      if (isSaved) {
                        mySaved.add(widget.data);
                      } else {
                        mySaved.length <= 1
                            ? mySaved.removeAt(0)
                            : mySaved.forEach((element) {
                                element == widget.data
                                    ? mySaved.remove(element)
                                    : null;
                              });
                      }
                      setState(() {});
                    },
                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          isSaved ? Icons.bookmark : Icons.bookmark_border,
                          color:
                              isSaved ? const Color(0xffE3562A) : Colors.black,
                        ),
                        radius: 21,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: getHeight(300),
                        margin: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              widget.data.thumbnail.toString(),
                            ),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "About Course",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.data.description.toString(),
                          style: const TextStyle(fontSize: 16.0),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "What you'll learn in this course",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.data.whatYouWillLearn.toString().trimLeft(),
                          style: const TextStyle(fontSize: 16.0),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Original Price",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.data.originalPrice.toString(),
                          style: const TextStyle(fontSize: 18.0),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Your Coupon Code",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SelectableText(
                          widget.data.couponCode.toString(),
                          style:
                              const TextStyle(fontSize: 20, color: Colors.teal),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        height: getHeight(60),
        width: getWidth(300),
        child: FloatingActionButton(
          onPressed: () {
            awesomDialog();
          },
          child: const Text("Buy Now"),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  awesomDialog() => AwesomeDialog(
      context: context,
      dialogType: DialogType.QUESTION,
      title: "Do you want to buy this course?",
      desc: "Confirm your payment method",
      btnOkOnPress: () async {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.SUCCES,
          title: "Congrats!",
          desc: "Now you have access to all the course's materials! Fighting!",
          btnOkOnPress: () {},
        ).show();
        myCourses.add(widget.data);
      },
      btnCancelOnPress: () {
        Navigator.pop(context);
      }).show();
}
