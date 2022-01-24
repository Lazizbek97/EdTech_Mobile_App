import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:udemy_coupons/data/data.dart';
import 'package:udemy_coupons/models/model_users/model_user.dart';
import 'package:udemy_coupons/size_config.dart';
import 'package:udemy_coupons/widgets/hive_boxes.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // @override
  // void dispose() {
  //   Hive.close();
  // }

  bool isVisual = false;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool isfilledFields = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: getHeight(700),
                padding: const EdgeInsets.only(top: 20),
                margin: EdgeInsets.symmetric(
                    vertical: getHeight(40), horizontal: getWidth(20)),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: Image.asset(
                        "assets/images/signup.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Text(
                      "Sign up",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    const Text("Create your account"),
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        hintText: "Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                      ),
                      onChanged: (v) {
                        if (_nameController.text.isNotEmpty &&
                            _emailController.text.isNotEmpty &&
                            _passwordController.text.isNotEmpty) {
                          isfilledFields = true;
                          setState(() {});
                        }
                      },
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: "E-mail",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                      ),
                      onChanged: (value) {
                        if (_nameController.text.isNotEmpty &&
                            _emailController.text.isNotEmpty &&
                            _passwordController.text.isNotEmpty) {
                          isfilledFields = true;
                          setState(() {});
                        }
                      },
                    ),
                    TextFormField(
                      onChanged: (value) {
                        if (_nameController.text.isNotEmpty &&
                            _emailController.text.isNotEmpty &&
                            _passwordController.text.isNotEmpty) {
                          isfilledFields = true;
                          setState(() {});
                        }
                      },
                      controller: _passwordController,
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
                              ? const Icon(Icons.visibility_off_outlined)
                              : const Icon(Icons.remove_red_eye_outlined),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getHeight(56),
                      width: getWidth(309),
                      child: ElevatedButton(
                        onPressed: () {
                          if (isfilledFields) {
                            User aUser = User(
                                name: _nameController.text,
                                email: _emailController.text,
                                password: _passwordController.text);
                            users.add(aUser);

                            addUser(_nameController.text, _emailController.text,
                                _passwordController.text);

                            print(UserBox.getUser().values.toList()[0].name);

                            Navigator.pushReplacementNamed(context, "/home",
                                arguments: aUser);
                          }
                        },
                        child: const Text("Sign up"),
                        style: ElevatedButton.styleFrom(
                          primary:
                              isfilledFields ? Color(0xffE3562A) : Colors.grey,
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
                          Navigator.pushNamed(context, "/signIn");
                        },
                        child: const Text(
                          "Login in",
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
              Positioned(
                top: 20,
                left: 20,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.transparent,
                    child: SvgPicture.asset("assets/images/back.svg"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future addUser(String name, String email, String password) async {
    final user = Users()
      ..name = name
      ..email = email
      ..password = password;

    final box = UserBox.getUser();
    box.add(user);
  }
}
