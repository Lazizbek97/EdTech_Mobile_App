import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:udemy_coupons/models/model_users/model_user.dart';
import 'package:udemy_coupons/size_config.dart';
import 'package:udemy_coupons/widgets/hive_boxes.dart';

import 'widgets/social_media_links.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isVisual = false;
  bool isFilledFields = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _emailKey = GlobalKey<FormState>();
  final _passwordKey = GlobalKey<FormState>();

  List<Users>? allUsers;
  int? userId;
  @override
  void initState() {
    super.initState();
    allUsers = UserBox.getUser().values.toList();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.96,
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Image.asset(
                    "assets/images/login.png",
                    fit: BoxFit.contain,
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        "Log in",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      const Text("Login with social networks"),
                      const SocialMediaLinks(),
                      Form(
                        key: _emailKey,
                        child: TextFormField(
                          controller: _emailController,
                          onChanged: (value) {
                            if (_emailController.text.isNotEmpty &&
                                _passwordController.text.isNotEmpty) {
                              isFilledFields = true;
                              setState(() {});
                            } else if (_emailController.text.isEmpty ||
                                _passwordController.text.isEmpty) {
                              isFilledFields = false;
                              setState(() {});
                            }
                          },
                          decoration: InputDecoration(
                            hintText: "Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                          ),
                          validator: (v) {
                            bool isMatched = false;
                            for (var element in allUsers!) {
                              if (element.email == _emailController.text) {
                                isMatched = true;
                                userId = allUsers!.indexOf(element);
                              }
                            }
                            if (!isMatched) {
                              return "Incorrect email";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      Form(
                        key: _passwordKey,
                        child: TextFormField(
                          controller: _passwordController,
                          onChanged: (value) {
                            if (_emailController.text.isNotEmpty &&
                                _passwordController.text.isNotEmpty) {
                              isFilledFields = true;
                              setState(() {});
                            } else if (_emailController.text.isEmpty ||
                                _passwordController.text.isEmpty) {
                              isFilledFields = false;
                              setState(() {});
                            }
                          },
                          obscureText: isVisual,
                          decoration: InputDecoration(
                            hintText: "Password",
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  isVisual = !isVisual;
                                });
                              },
                              child: isVisual
                                  ? const Icon(Icons.remove_red_eye_outlined)
                                  : const Icon(Icons.visibility_off_outlined),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                          ),
                          validator: (v) {
                            bool isMatched = false;
                            for (var element in allUsers!) {
                              if (element.password ==
                                  _passwordController.text) {
                                isMatched = true;
                                userId = allUsers!.indexOf(element);
                              }
                            }
                            if (!isMatched) {
                              return "Incorrect password";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        height: getHeight(56),
                        width: getWidth(309),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_emailKey.currentState!.validate() &&
                                _passwordKey.currentState!.validate()) {
                              print(allUsers!.length);
                              isFilledFields
                                  ? Navigator.pushReplacementNamed(
                                      context, "/home",
                                      arguments: userId)
                                  : null;
                            }
                          },
                          child: const Text("Log in"),
                          style: ElevatedButton.styleFrom(
                            primary: isFilledFields
                                ? const Color(0xffE3562A)
                                : Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: getHeight(56),
                        width: getWidth(309),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/signUp");
                          },
                          child: const Text(
                            "Sign up",
                            style: TextStyle(color: Colors.black),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            elevation: 0,
                            shadowColor: Colors.green.shade500,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
