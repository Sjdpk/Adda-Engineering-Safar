import '../../../Screens/Details/details_screen.dart';
import '../../../components/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget favouriteCard(
  String mainCollection,
  user,
  program,
) {
  return StreamBuilder(
    stream: FirebaseFirestore.instance
        .collection(mainCollection)
        .doc(user)
        .collection(program)
        .snapshots(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (!snapshot.hasData) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      return ListView(
        children: snapshot.data.docs.map((document) {
          return document['isFavourite'] == false
              ? Container(
                  margin: EdgeInsets.symmetric(horizontal: 11, vertical: 10),
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(29),
                    color: Constant.lightYellow,
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
                )
              : null;
        }).toList() as List<Widget>,
      );
    },
  );
}
