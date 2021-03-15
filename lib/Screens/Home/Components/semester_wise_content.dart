import '../../../Screens/Details/details_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget semesterWiseContent(
  String mainCollection,
  program,
  semester,
) {
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
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 11, vertical: 10),
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(29),
              color: Colors.white10,
            ),
            alignment: Alignment.center,
            child: ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return DetailsScreen(
                        noteId: document['noteId'],
                        noteTitle: document['noteTitle'],
                        noteCredit: document['noteCredit'],
                        creditHour: document['creditHour'],
                        noteProgram: document['noteProgram'],
                        noteSemester: document['noteSemester'],
                        coverImage: document['coverImage'],
                        noteDetails: document['noteDetails'],
                        noteUrl: document['noteUrl'],
                      );
                    },
                  ),
                );
              },
              leading: ClipOval(
                  child: SvgPicture.asset(
                document['coverImage'],
                height: 40,
              )),
              title: Text(
                document['noteTitle'].toString().substring(0, 1).toUpperCase() +
                    document['noteTitle'].toString().substring(1),
                style: TextStyle(fontSize: 23, letterSpacing: 1),
              ),
              subtitle: Text(
                document['noteCredit']
                        .toString()
                        .substring(0, 1)
                        .toUpperCase() +
                    document['noteCredit'].toString().substring(1),
              ),
              trailing: SvgPicture.asset(
                'assets/icons/play.svg',
                color: Colors.orangeAccent,
                height: 30,
              ),
            ),
          );
        }).toList(),
      );
    },
  );
}
