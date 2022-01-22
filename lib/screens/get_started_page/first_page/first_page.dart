import 'package:flutter/material.dart';

//* First Page Entery

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, "/aboutApp");
          },
          child: Center(
            child: Image.asset("assets/images/Content.png"),
          ),
        ),
      ),
    );
  }
}
