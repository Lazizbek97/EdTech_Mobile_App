import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:udemy_coupons/data/data.dart';
import 'package:udemy_coupons/models/model_users/model_user.dart';
import 'package:udemy_coupons/widgets/hive_boxes.dart';

import '../../size_config.dart';

class SettingPage extends StatefulWidget {
  SettingPage({
    Key? key,
  }) : super(key: key);
  User aUser = users.last;
  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _switchValue = false;
  late Users curUser;

  @override
  void initState() {
    setState(() {});
    curUser = UserBox.getUser().values.toList().last;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        leadingWidth: getWidth(80),
        leading: InkWell(
          onTap: () {},
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: SvgPicture.asset("assets/images/back.svg"),
          ),
        ),
        title: const Text(
          "Settings",
          style: TextStyle(fontSize: 27),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                child: Image.asset("assets/images/settings.png"),
              ),
            ),
            Container(
              height: getHeight(80),
              width: getWidth(330),
              alignment: Alignment.center,
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Color(0xff65AAEA),
                  child: Icon(
                    Icons.notifications,
                    color: Colors.white,
                  ),
                ),
                title: const Text(
                  "Notifications",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: CupertinoSwitch(
                  value: _switchValue,
                  onChanged: (value) {
                    setState(() {
                      _switchValue = value;
                    });
                  },
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey, width: 1)),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Account information",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/edit", arguments: "name");
              },
              child: Container(
                height: getHeight(80),
                width: getWidth(330),
                alignment: Alignment.center,
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Color(0xff65AAEA),
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                  title: const Text(
                    "Name",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(curUser.name),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey, width: 1)),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/edit", arguments: "email");
              },
              child: Container(
                height: getHeight(80),
                width: getWidth(330),
                alignment: Alignment.center,
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Color(0xff65AAEA),
                    child: Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                  ),
                  title: const Text(
                    "Email",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(curUser.email),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey, width: 1)),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/edit", arguments: "password");
              },
              child: Container(
                height: getHeight(80),
                width: getWidth(330),
                alignment: Alignment.center,
                child: const ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Color(0xff65AAEA),
                    child: Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                  ),
                  title: Text(
                    "Password",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text("changed 2 weeks ago"),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey, width: 1)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
