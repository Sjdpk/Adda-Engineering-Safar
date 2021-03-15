import 'package:flutter_svg/svg.dart';

import '../Authentication/authentication_service.dart';
import '../Screens/Explore/explore_notes.dart';
import '../Screens/Favourite/favourite_notes.dart';
import '../Screens/Home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Component/drawer_widget.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    ExploreNotes(),
    FavouriteNotes(),
  ];
  void onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: DrawerWidget(),
      ),
      // backgroundColor: Colors.white,
      appBar: AppBar(
        // leading: IconButton(
        //   icon: Icon(Icons.menu, color: Colors.white), // set your color here
        //   onPressed: () => _scaffoldKey.currentState.openDrawer(),
        // ),
        leading: GestureDetector(
          onTap: () => _scaffoldKey.currentState.openDrawer(),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: SvgPicture.asset(
              'assets/icons/menu.svg',
            ),
          ),
        ),
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.elliptical(20, 7),
            bottomRight: Radius.elliptical(20, 7),
          ),
        ),
        elevation: 0.0,
        title: const Text(
          'Adda Enineering Sarathi',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: size.height / 4,
                            width: size.width / 1.5,
                            color: Colors.black26,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Update Profile ? ',
                                  style: TextStyle(fontSize: 22),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    context
                                        .read<AuthenticationService>()
                                        .signOut();
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    height: 40,
                                    width: 200,
                                    child: Text(
                                      'Log Out',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              },
              child: CircleAvatar(
                radius: 30.0,
                backgroundImage: AssetImage(
                  'assets/images/img.jpg',
                ),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        fixedColor: Colors.white,
        unselectedItemColor: Colors.white38,
        elevation: 0,
        onTap: onTabTapped,
        currentIndex: _selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border_outlined),
            label: 'Library',
          ),
        ],
      ),
    );
  }
}
