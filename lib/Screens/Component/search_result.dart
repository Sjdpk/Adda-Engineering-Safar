import 'package:adda/Screens/Details/details_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class ShowSearchResult extends SearchDelegate<String> {
  final currentUserProgram, currentUserSemester;

  ShowSearchResult({
    this.currentUserProgram,
    this.currentUserSemester,
  });

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.close,
          color: Colors.white,
        ),
        onPressed: () {
          close(context, null);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios, color: Colors.white),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(
        query,
        style: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.w900,
          fontSize: 30,
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('noteDetails')
          .doc(currentUserProgram)
          .collection(currentUserSemester)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData)
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
          );

        final results = snapshot.data.docs
            .where((data) => data['noteTitle'].contains(query));

        return Container(
          color: Colors.black,
          child: ListView(
            children: results
                .map<Widget>(
                  (data) => Container(
                    margin: EdgeInsets.symmetric(horizontal: 11, vertical: 10),
                    height: 70,
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
                                noteId: data['noteId'],
                                noteTitle: data['noteTitle'],
                                noteCredit: data['noteCredit'],
                                creditHour: data['creditHour'],
                                noteProgram: data['noteProgram'],
                                noteSemester: data['noteSemester'],
                                coverImage: data['coverImage'],
                                noteDetails: data['noteDetails'],
                                noteUrl: data['noteUrl'],
                              );
                            },
                          ),
                        );
                      },
                      // leading: ClipOval(
                      //   child: SvgPicture.asset(
                      //     data['coverImage'],
                      //     height: 40,
                      //   ),
                      // ),
                      title: Text(
                        data['noteTitle']
                                .toString()
                                .substring(0, 1)
                                .toUpperCase() +
                            data['noteTitle'].toString().substring(1),
                        style: TextStyle(fontSize: 23, letterSpacing: 1),
                      ),
                      subtitle: Text(
                        data['noteCredit'],
                      ),
                      // trailing: SvgPicture.asset(
                      //   'assets/icons/play.svg',
                      //   color: Colors.orangeAccent,
                      //   height: 30,
                      // ),
                    ),
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}
