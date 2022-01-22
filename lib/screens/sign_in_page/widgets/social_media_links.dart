import 'package:flutter/material.dart';

import '../../../size_config.dart';

class SocialMediaLinks extends StatelessWidget {
  const SocialMediaLinks({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {},
          child: SizedBox(
            height: getHeight(40),
            width: getHeight(40),
            child: Image.asset(
              "assets/images/facebook.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
          child: InkWell(
            onTap: () {},
            child: SizedBox(
              height: getHeight(40),
              width: getHeight(40),
              child: Image.asset(
                "assets/images/instagram.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: SizedBox(
            height: getHeight(40),
            width: getHeight(40),
            child: Image.asset(
              "assets/images/google.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
