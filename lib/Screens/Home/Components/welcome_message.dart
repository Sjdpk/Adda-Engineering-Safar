import 'package:adda/components/constants.dart';

import '../Components/search_button.dart';
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
                  color: Colors.black,
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
                  color: Colors.grey,
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
            color: Colors.black,
            fontSize: 20,
            letterSpacing: 1,
          ),
        ),
        SizedBox(
          height: 27.0,
        ),
        Container(
          width: double.infinity,
          child: SearchButton(
            hintText: "Search for anythings",
            onChanged: (value) {},
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
        Text(
          'All Notes',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
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
