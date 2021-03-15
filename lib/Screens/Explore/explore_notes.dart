//  ExploreNotes

import 'package:adda/Authentication/authentication_service.dart';
import 'package:adda/Models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import '../Component/search_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ExploreNotes extends StatefulWidget {
  @override
  _ExploreNotesState createState() => _ExploreNotesState();
}

class _ExploreNotesState extends State<ExploreNotes> {
  FirebaseAuth auth = FirebaseAuth.instance;

  final CollectionReference userRef =
      FirebaseFirestore.instance.collection("users");

  UserModel _currentUser;

  // String _username;

  String _program;

  String _semester;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  getCurrentUser() async {
    UserModel currentUser = await context
        .read<AuthenticationService>()
        .getUserFromDB(uid: auth.currentUser.uid);

    _currentUser = currentUser;

    print("${_currentUser.username}");

    setState(() {
      // _username = _currentUser.username;
      _program = _currentUser.program;
      _semester = _currentUser.semester;
      // _email = _currentUser.email;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          GestureDetector(
            onTap: () {
              showSearch(
                context: context,
                delegate: ShowSearchResult(
                    currentUserProgram: _program,
                    currentUserSemester: _semester),
              );
            },
            child: Container(
              alignment: Alignment.centerLeft,
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(29),
                border: Border.all(
                  color: Colors.white,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.search),
                    Text(
                      'Search what you want ... ',
                      style: TextStyle(letterSpacing: 2),
                    ),
                    Icon(Icons.visibility, color: Colors.black),
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: SvgPicture.asset('assets/images/it.svg'),
          ),
        ],
      ),
    );
  }
}
