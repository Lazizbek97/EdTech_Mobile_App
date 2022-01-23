import 'package:hive/hive.dart';

part 'model_user.g.dart';

@HiveType(typeId: 1)
class Users extends HiveObject {
  @HiveField(0)
  late String name;
  @HiveField(1)
  late String email;
  @HiveField(2)
  late String password;
}
