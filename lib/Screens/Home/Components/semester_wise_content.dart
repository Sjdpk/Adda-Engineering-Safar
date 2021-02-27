import 'package:adda/components/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget semesterWiseContent(String mainCollection, program, semester,
    [Function press]) {
  // var colors = [
  //   Colors.red,
  //   Colors.blue,
  //   Colors.cyan,
  //   Colors.green,
  //   Colors.yellow,
  //   Colors.lightBlue,
  // ];

  return StreamBuilder(
    stream: FirebaseFirestore.instance
        .collection(mainCollection)
        .doc(program)
        .collection(semester)
        .snapshots(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (!snapshot.hasData) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      return ListView(
        children: snapshot.data.docs.map((document) {
          return GestureDetector(
            onDoubleTap: press,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 11, vertical: 10),
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(29),
                color: Constant.lightYellow,
              ),
              alignment: Alignment.center,
              child: ListTile(
                leading: ClipOval(
                  child: Image(
                    image: AssetImage('assets/images/img.jpg'),
                    height: 40,
                  ),
                ),
                title: Text(
                  document['noteTitle'],
                ),
                subtitle: Text(
                  document['noteCredit'],
                ),
                trailing: SvgPicture.asset(
                  'assets/icons/play.svg',
                  color: Colors.orangeAccent,
                  height: 30,
                ),
              ),
            ),
          );
        }).toList(),
      );
    },
  );
}
