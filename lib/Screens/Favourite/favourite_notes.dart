// FavouriteNotes

import '../../Authentication/authentication_service.dart';
import '../../Models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteNotes extends StatefulWidget {
  @override
  _FavouriteNotesState createState() => _FavouriteNotesState();
}

class _FavouriteNotesState extends State<FavouriteNotes> {
  FirebaseAuth auth = FirebaseAuth.instance;
  final CollectionReference userRef =
      FirebaseFirestore.instance.collection("users");
  UserModel _currentUser;

  // String _uid;
  // String _username;
  // String _program;
  // String _semester;

  // String _email;

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

    // setState(() {
    //   _username = _currentUser.username;
    //   _program = _currentUser.program;
    //   _semester = _currentUser.semester;
    //   // _email = _currentUser.email;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return _currentUser == null
        ? Container(
            color: Colors.black,
            child: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
            ),
          )
        : Scaffold(
            backgroundColor: Colors.black,
            body: ListView(
              children: [
                Center(
                  child: Text(
                    'Favourites Notes',
                    style: TextStyle(fontSize: 22),
                  ),
                )
              ],
            ),
          );
  }
}
