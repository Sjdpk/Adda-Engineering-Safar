import 'package:flutter/material.dart';
import 'package:adda/Screens/Signup/signup_screen.dart';
import 'package:adda/components/already_have_an_account_acheck.dart';
import 'package:adda/components/rounded_button.dart';
import 'package:adda/components/rounded_input_field.dart';
import 'package:adda/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';

import '../main_page.dart';
import 'background.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Explore Engineering",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/login.svg",
                height: size.height * 0.35,
              ),
              SizedBox(height: size.height * 0.03),
              RoundedInputField(
                hintText: "Your Email",
                onChanged: (value) {},
              ),
              RoundedPasswordField(
                onChanged: (value) {},
              ),
              RoundedButton(
                text: "LOGIN",
                press: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return MainPage();
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUpScreen();
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
