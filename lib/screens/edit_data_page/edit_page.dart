import 'package:flutter/material.dart';
import 'package:udemy_coupons/data/data.dart';

import '../../size_config.dart';

class EditPage extends StatefulWidget {
  EditPage({Key? key, required this.text}) : super(key: key);
  User aUser = users.last;
  String text;
  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  String? context1;
  @override
  void initState() {
    if (widget.text == "name") {
      context1 = widget.aUser.name;
    } else if (widget.text == "email") {
      context1 = widget.aUser.email;
    } else {
      context1 = widget.aUser.password;
    }
  }

  TextEditingController _controllerText = TextEditingController();

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
            child: const Icon(Icons.arrow_back_ios),
          ),
          title: Text(
            "Edit ${widget.text}",
            style: const TextStyle(fontSize: 20),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                users.forEach(
                  (element) {
                    if (element == widget.aUser) {
                      if (widget.text == "name") {
                        element.name = _controllerText.text;
                      } else if (widget.text == "email") {
                        element.email = _controllerText.text;
                      } else {
                        element.password = _controllerText.text;
                      }
                    }
                  },
                );
                setState(() {});
                Navigator.pushReplacementNamed(context, "/home");
              },
              icon: const Icon(Icons.check),
              highlightColor: const Color(0xffE3562A),
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 30,
          ),
          child: TextFormField(
            controller: _controllerText,
            decoration: InputDecoration(
              hintText: context1,
            ),
          ),
        ));
  }
}