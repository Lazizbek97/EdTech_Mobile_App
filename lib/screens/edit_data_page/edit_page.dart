import 'package:flutter/material.dart';
import 'package:udemy_coupons/data/data.dart';
import 'package:udemy_coupons/models/model_users/model_user.dart';
import 'package:udemy_coupons/widgets/hive_boxes.dart';

import '../../size_config.dart';

class EditPage extends StatefulWidget {
  EditPage({
    Key? key,
    required this.text,
    required this.userId,
  }) : super(key: key);
  // User aUser = users.last;
  String text;
  int userId;
  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  String? context1;

  late Users curUser;
  @override
  void initState() {
    curUser = UserBox.getUser().values.toList()[widget.userId];

    if (widget.text == "name") {
      context1 = curUser.name;
    } else if (widget.text == "email") {
      context1 = curUser.email;
    } else {
      context1 = curUser.password;
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
                if (widget.text == "name") {
                  curUser.name = _controllerText.text;
                } else if (widget.text == "email") {
                  curUser.email = _controllerText.text;
                } else {
                  curUser.password = _controllerText.text;
                }
                curUser.save();

                setState(() {});
                Navigator.pushReplacementNamed(context, "/home",
                    arguments: widget.userId);
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
