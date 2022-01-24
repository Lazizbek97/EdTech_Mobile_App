import 'package:flutter/material.dart';
import 'package:udemy_coupons/data/data.dart';
import 'package:udemy_coupons/models/model_udemy.dart';
import 'package:udemy_coupons/screens/about_page/about_page.dart';
import 'package:udemy_coupons/screens/course_details/course_details.dart';
import 'package:udemy_coupons/screens/edit_data_page/edit_page.dart';
import 'package:udemy_coupons/screens/get_started_page/aboutApplication/about_app.dart';
import 'package:udemy_coupons/screens/get_started_page/first_page/first_page.dart';
import 'package:udemy_coupons/screens/home_page/myhomePage.dart';
import 'package:udemy_coupons/screens/lessons/lessons.dart';
import 'package:udemy_coupons/screens/my_courses/my_courses.dart';
import 'package:udemy_coupons/screens/my_saved_courses/my_saved.dart';
import 'package:udemy_coupons/screens/no_saved_data/no_data.dart';
import 'package:udemy_coupons/screens/search_page/search_page.dart';
import 'package:udemy_coupons/screens/setting_page/setting_page.dart';
import 'package:udemy_coupons/screens/sign_in_page/sign_in.dart';
import 'package:udemy_coupons/screens/sign_up_page/sign_up.dart';

class RouterGenerator {
  static generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const FirstPage(),
        );
      case '/aboutApp':
        return MaterialPageRoute(
          builder: (context) => const AboutApplication(),
        );
      case '/signIn':
        return MaterialPageRoute(
          builder: (context) => const SignInPage(),
        );
      case '/signUp':
        return MaterialPageRoute(
          builder: (context) => const SignUpPage(),
        );
      case '/home':
        return MaterialPageRoute(
          builder: (context) => MyHomePage(
            userId: args as int,
          ),
        );
      case '/about':
        return MaterialPageRoute(
          builder: (context) => AboutPage(
            data: (args as ModelUdemy),
          ),
        );
      case '/search':
        return MaterialPageRoute(
          builder: (context) => SearchPage(
            data: args as List<ModelUdemy>,
          ),
        );
      case '/edit':
        return MaterialPageRoute(
          builder: (context) => EditPage(
            text: (args as List)[0],
            userId: (args as List)[1],
          ),
        );
      case '/myCourses':
        return MaterialPageRoute(
          builder: (context) => MyCourses(),
        );
      case '/mySaved':
        return MaterialPageRoute(
          builder: (context) => MySaved(),
        );
      case '/courseDetails':
        return MaterialPageRoute(
          builder: (context) => CourseDetails(
            data: args as ModelUdemy,
          ),
        );
      case '/lessons':
        return MaterialPageRoute(
          builder: (context) => LessonsPage(
            data: args as ModelUdemy,
          ),
        );

      case '/saved':
        return MaterialPageRoute(
          builder: (context) => NoDataFound(
            title: (args as List)[0],
            text1: args[1],
            text2: args[2],
            imgLink: args[3],
            buttonText: args[4],
          ),
        );
    }
  }
}
