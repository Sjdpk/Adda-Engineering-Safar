import 'package:adda/Authentication/authentication_service.dart';
import 'package:adda/Models/note_data_details.dart';
import 'package:adda/Models/user_model.dart';
import 'package:adda/Screens/Details/details_screen.dart';
import 'package:adda/components/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Components/notes_cards.dart';
import 'Components/semester_wise_content.dart';
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
  String _program;
  String _semester;

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
      _program = _currentUser.program;
      _semester = _currentUser.semester;
      // _email = _currentUser.email;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return _currentUser == null
        ? Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.green),
            ),
          )
        : Scaffold(
            body: DefaultTabController(
              length: 9,
              child: NestedScrollView(
                headerSliverBuilder: (context, value) {
                  return [
                    SliverAppBar(
                      elevation: 0.0,
                      expandedHeight: size.height / 2.4,
                      floating: true,
                      pinned: true,
                      stretch: true,
                      onStretchTrigger: () {
                        // Refresh the list, maybe?
                        return;
                      },
                      flexibleSpace: FlexibleSpaceBar(
                        background:
                            welcomeMessage(_username, _program, _semester),
                        stretchModes: [
                          StretchMode.zoomBackground,
                          StretchMode.blurBackground,
                          StretchMode.fadeTitle,
                        ],
                      ),
                      bottom: TabBar(
                        unselectedLabelColor: Constant.grey,
                        // indicatorSize: TabBarIndicatorSize.label,
                        indicatorWeight: 3,
                        indicatorPadding: EdgeInsets.all(23),
                        indicatorColor: Colors.red,
                        labelColor: Constant.blueDark,
                        labelStyle: TextStyle(fontSize: 18),
                        // labelPadding: EdgeInsets.symmetric(horizontal: 10),
                        isScrollable: true,
                        tabs: [
                          Tab(text: 'Current Semester'),
                          (_semester == '1 st Semester')
                              ? Tab(text: 'Current Semester')
                              : Tab(text: '1st Semester'),
                          (_semester == '2 nd Semester')
                              ? Tab(text: 'Current Semester')
                              : Tab(text: '2nd Semester'),
                          (_semester == '3 rd Semester')
                              ? Tab(text: 'Current Semester')
                              : Tab(text: '3rd Semester'),
                          (_semester == '4 th Semester')
                              ? Tab(text: 'Current Semester')
                              : Tab(text: '4th Semester'),
                          (_semester == '5 th Semester')
                              ? Tab(text: 'Current Semester')
                              : Tab(text: '5th Semester'),
                          (_semester == '6 th Semester')
                              ? Tab(text: 'Current Semester')
                              : Tab(
                                  text: '6th Semester',
                                ),
                          (_semester == '7 th Semester')
                              ? Tab(text: 'Current Semester')
                              : Tab(text: '7th Semester'),
                          (_semester == '8 th Semester')
                              ? Tab(text: 'Current Semester')
                              : Tab(text: '8th Semester'),
                        ],
                      ),
                    ),
                  ];
                },
                body: TabBarView(
                  children: [
                    semesterWiseContent(
                      'noteDetails',
                      _program,
                      _semester,
                    ),
                    semesterWiseContent(
                      'noteDetails',
                      _program,
                      '1 st Semester',
                    ),
                    semesterWiseContent(
                      'noteDetails',
                      _program,
                      '2 nd Semester',
                    ),
                    semesterWiseContent(
                      'noteDetails',
                      _program,
                      '3 rd Semester',
                    ),
                    semesterWiseContent(
                      'noteDetails',
                      _program,
                      '4 th Semester',
                    ),
                    semesterWiseContent(
                      'noteDetails',
                      _program,
                      '5 th Semester',
                    ),
                    semesterWiseContent(
                      'noteDetails',
                      _program,
                      '6 th Semester',
                    ),
                    semesterWiseContent(
                      'noteDetails',
                      _program,
                      '7 th Semester',
                    ),
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
                ),
              ),
            ),
          );
  }
}
