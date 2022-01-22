import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:udemy_coupons/models/model_udemy.dart';

class ServiceUdemy {
  static String url =
      "https://udemy-courses-coupon-code.p.rapidapi.com/api/udemy_course/";

  static Future fetchData() async {
    final response = await http.get(
      Uri.parse(url),
      // Send authorization headers to the backend.

      headers: {
        'x-rapidapi-host': "udemy-courses-coupon-code.p.rapidapi.com",
        'x-rapidapi-key': "5135af140dmshe8830315ad32694p18ac46jsncafa56229fcc"
      },
    );
    final responseJson = jsonDecode(response.body);

    return (responseJson as List)
        .map(
          (e) => ModelUdemy.fromJson(e),
        )
        .toList();
  }
}
// * another subscribtion
 //  'x-rapidapi-host': "udemy-courses-coupon-code.p.rapidapi.com",
      // 'x-rapidapi-key': "e90e3e99f8mshce0c4a231beb3f6p1bb332jsn4e4b72e53465"
