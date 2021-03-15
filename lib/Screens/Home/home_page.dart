import '../Component/search_result.dart';

import '../../Authentication/authentication_service.dart';
import '../../Models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            body: DefaultTabController(
              length: 9,
              child: NestedScrollView(
                headerSliverBuilder: (context, value) {
                  return [
                    SliverAppBar(
                      backgroundColor: Colors.black,
                      elevation: 0.0,
                      expandedHeight: size.height / 2.5,
                      floating: true,
                      pinned: true,
                      stretch: true,
                      onStretchTrigger: () {
                        // Refresh the list, maybe?
                        return;
                      } as Future<void> Function(),
                      flexibleSpace: FlexibleSpaceBar(
                        background: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            welcomeMessage(_username, _program, _semester),
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
                                margin: EdgeInsets.symmetric(horizontal: 15),
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(29),
                                  color: Colors.black,
                                  border: Border.all(color: Colors.white),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.search,
                                    ),
                                    Text(
                                      'Search what you want ... ',
                                      style: TextStyle(letterSpacing: 2),
                                    ),
                                    Icon(
                                      Icons.visibility,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            Text(
                              'All Notes',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                          ],
                        ),
                        stretchModes: [
                          StretchMode.zoomBackground,
                          StretchMode.blurBackground,
                          StretchMode.fadeTitle,
                        ],
                      ),
                      bottom: TabBar(
                        unselectedLabelColor: Colors.white54,
                        // indicatorSize: TabBarIndicatorSize.label,
                        indicatorWeight: 3,
                        indicatorPadding: EdgeInsets.all(23),
                        indicatorColor: Colors.red,
                        labelColor: Colors.white,
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
                    semesterWiseContent(
                      'noteDetails',
                      _program,
                      '8 th Semester',
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
