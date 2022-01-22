import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  Category({Key? key, required this.title}) : super(key: key);
  String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "#" + title,
        style: TextStyle(color: Colors.white),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
