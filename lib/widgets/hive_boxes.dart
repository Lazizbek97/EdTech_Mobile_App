import 'package:hive/hive.dart';
import 'package:udemy_coupons/models/model_udemy.dart';
import 'package:udemy_coupons/models/model_users/model_user.dart';

class UserBox {
  static Box<Users> getUser() => Hive.box<Users>("users");
}

class CourseBoxes {
  static Box<ModelUdemy> getCourse() => Hive.box<ModelUdemy>("courses");
}
