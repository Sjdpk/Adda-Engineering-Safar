import '../../../components/constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget welcomeMessage(String userName, String program, String semester) {
  return Container(
    margin: EdgeInsets.all(10),
    child: Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: 'Hey ',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              TextSpan(
                text: userName.substring(0, 1).toUpperCase() +
                    userName.substring(1),
                style: TextStyle(
                  color: Constant.kPrimaryColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 4),
        RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: program + ' : ',
                style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 1,
                ),
              ),
              TextSpan(
                text: semester,
                style: TextStyle(
                  color: Constant.kPrimaryColor,
                  fontSize: 16,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 17.0,
        ),
        Text(
          'Find a course you want to learn',
          style: TextStyle(
            fontSize: 20,
            letterSpacing: 1,
          ),
        ),
        SizedBox(
          height: 15.0,
        ),
      ],
    ),
  );
}
