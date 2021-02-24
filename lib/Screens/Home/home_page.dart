import 'package:adda/Authentication/authentication_service.dart';
import 'package:adda/Models/note_data_details.dart';
import 'package:adda/Models/user_model.dart';
import 'package:adda/Screens/Details/details_screen.dart';
import 'package:adda/Screens/Home/auth_screen_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Components/notes_cards.dart';
import 'Components/semesters.dart';
import 'Components/welcome_message.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  final CollectionReference userRef =
      FirebaseFirestore.instance.collection("users");
  UserModel _currentUser;

  // String _uid;
  String _username;
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

    print("${_currentUser.username}");

    setState(() {
      // _uid = _currentUser.uid;
      _username = _currentUser.username;
      // _semester = _currentUser.semester;
      // _email = _currentUser.email;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _currentUser == null
        ? Center(
            child: Column(
              children: [
                CircularProgressIndicator(),
                FlatButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return AuthScreenView();
                        },
                      ),
                    );
                  },
                  child: Text('Home page'),
                )
              ],
            ),
          )
        : ListView(
            // shrinkWrap: true,
            // physics: ClampingScrollPhysics(),
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              welcomeMessage(_username),
              Semesters(),
              ListView.builder(
                padding: EdgeInsets.all(13),
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: 6,
                itemBuilder: (context, index) => Notescard(
                  notesDataDetails: noteDetails[index],
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return DetailsScreen(
                              noteDataDetails: noteDetails[index]);
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          );
  }
}
