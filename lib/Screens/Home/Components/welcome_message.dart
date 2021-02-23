import '../Components/search_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget welcomeMessage() {
  return Container(
    margin: EdgeInsets.all(10),
    child: Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hey Deepak,',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
            letterSpacing: 1,
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
