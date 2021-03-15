import '../../Screens/Register/register_page.dart';
import '../../Screens/SignIn/signin_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthScreenView extends StatefulWidget {
  @override
  _AuthScreenViewState createState() => _AuthScreenViewState();
}

class _AuthScreenViewState extends State<AuthScreenView> {
  PageController pageController;
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  onPageChanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  onTap(int pageIndex) {
    //pageController.jumpToPage(pageIndex);
    pageController.animateToPage(pageIndex,
        duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          //when pageIndex == 0
          LoginPage(),

          //when pageIndex == 1
          RegisterPage()
        ],
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: Container(
        height: 0,
        child: BottomNavigationBar(
          currentIndex: pageIndex,
          onTap: onTap,
          selectedItemColor: Colors.black,
          items: [
            BottomNavigationBarItem(
              label: "Log-In",
              icon: Icon(
                Icons.account_circle,
              ),
            ),
            BottomNavigationBarItem(
                label: "Register",
                icon: Icon(
                  Icons.new_releases,
                )),
          ],
        ),
      ),
    );
  }
}
