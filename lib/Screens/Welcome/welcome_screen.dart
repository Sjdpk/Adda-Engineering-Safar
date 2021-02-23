import 'package:adda/Screens/Register/register_page.dart';
import 'package:adda/Screens/SignIn/signin_page.dart';
import 'package:adda/components/constants.dart';
import 'package:adda/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'background.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RichText(
                text: TextSpan(
                  text: 'Welcome to ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Adda-Engineering Sarathi',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 21,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.05),
              SvgPicture.asset(
                "assets/icons/welcomepage.svg",
                height: size.height * 0.45,
              ),
              SizedBox(height: size.height * 0.05),
              RoundedButton(
                text: "Explore Engineering ",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginPage();
                      },
                    ),
                  );
                },
              ),
              RoundedButton(
                text: "Join Engineering Sarathi",
                color: Constant.kPrimaryLightColor,
                textColor: Colors.black,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return RegisterPage();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
