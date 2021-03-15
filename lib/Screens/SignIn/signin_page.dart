import '../../Authentication/authentication_service.dart';
import '../../Screens/Register/register_page.dart';
import '../../components/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  String _email, _password;
  bool _isSubmitting;

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  FirebaseAuth auth = FirebaseAuth.instance;
  final DateTime timestamp = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        key: _scaffoldKey,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    _showTitle(),
                    SizedBox(height: size.height * 0.03),
                    SvgPicture.asset(
                      "assets/icons/login.svg",
                      height: size.height * 0.35,
                    ),
                    _showEmailInput(),
                    _showPasswordInput(),
                    _showFormActions(),
                    _showSwitchScreen(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _showTitle() {
    return Text(
      "Explore Aadda Engineering Sarathi",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 19,
      ),
    );
  }

  _showEmailInput() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 20, left: 10),
      padding: EdgeInsets.only(left: 30, right: 10),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(29),
        border: Border.all(color: Colors.white),
      ),
      child: TextFormField(
        cursorColor: Colors.white,
        onSaved: (val) => _email = val,
        validator: (val) => !val.contains("@") ? "Invalid Email" : null,
        decoration: InputDecoration(
          hintText: "Enter Valid Email",
          icon: Icon(
            Icons.mail,
            color: Constant.kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  _showPasswordInput() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 20, left: 10),
      padding: EdgeInsets.only(left: 30, right: 10),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(29),
        border: Border.all(color: Colors.white),
      ),
      child: TextFormField(
        cursorColor: Colors.white,
        onSaved: (val) => _password = val,
        validator: (val) => val.length < 6 ? "Password Is Too Short" : null,
        obscureText: _obscureText,
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
          ),
          border: InputBorder.none,
          hintText: "Enter Valid Password",
          icon: Icon(
            Icons.lock,
            color: Constant.kPrimaryColor,
          ),
        ),
      ),
    );
  }

  _showSwitchScreen() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don't have an Account ? ",
            style: TextStyle(fontSize: 17, color: Constant.kPrimaryColor),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return RegisterPage();
                  },
                ),
              );
            },
            child: Text(
              "SignUp",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Constant.kPrimaryColor,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _showFormActions() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          _isSubmitting == true
              ? CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.green),
                )
              : Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 20, left: 10),
                  padding: EdgeInsets.only(left: 30, right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Constant.kPrimaryColor,
                    border: Border.all(
                      color: Constant.kPrimaryColor,
                    ),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      primary: Constant.kPrimaryColor,
                    ),
                    child: Text(
                      "SIGNIN",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    onPressed: _submit,
                  ),
                ),
        ],
      ),
    );
  }

  _submit() {
    final _form = _formKey.currentState;
    if (_form.validate()) {
      _form.save();
      //print("Email $_email, Password $_password");
      _loginUser();
    } else {
      print("Form is Invalid");
    }
  }

  _loginUser() async {
    setState(() {
      _isSubmitting = true;
    });

    final logMessage = await context
        .read<AuthenticationService>()
        .signIn(email: _email, password: _password);

    logMessage == "Signed In"
        ? _showSuccessSnack(logMessage)
        : _showErrorSnack(logMessage);

    //print("I am logMessage $logMessage");

    if (logMessage == "Signed In") {
      return;
    } else {
      setState(() {
        _isSubmitting = false;
      });
    }
  }

  _showSuccessSnack(String message) async {
    final snackbar = SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        "$message",
        style: TextStyle(color: Colors.green),
      ),
    );
    // ignore: deprecated_member_use
    _scaffoldKey.currentState.showSnackBar(snackbar);
    _formKey.currentState.reset();
  }

  _showErrorSnack(String message) {
    final snackbar = SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        "$message",
        style: TextStyle(color: Colors.red),
      ),
    );
    // ignore: deprecated_member_use
    _scaffoldKey.currentState.showSnackBar(snackbar);
    setState(() {
      _isSubmitting = false;
    });
  }
}
