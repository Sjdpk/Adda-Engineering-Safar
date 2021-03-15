import '../../Authentication/authentication_service.dart';
import '../../Screens/SignIn/signin_page.dart';
import '../../components/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
//To Toggle Password Text Visibility.
  bool _obscureText = true;
  String _username, _email, _password, _selectedProgram, _selectedSemester;
  List<String> _programs = [
    'BE-Civil',
    'BE-Elx & Com',
    'BE-Computer',
    'BE-IT',
    'BE-Software',
    'Others',
  ];
  List<String> _semesters = [
    '1 st Semester',
    '2 nd Semester',
    '3 rd Semester',
    '4 th Semester',
    '5 th Semester',
    '6 th Semester',
    '7 th Semester',
    '8 th Semester',
  ];

//For the loading state.
  bool _isSubmitting;
  String _university = 'Pokhara University';
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
                      "assets/icons/signup.svg",
                      height: size.height * 0.35,
                    ),
                    _showUsernameInput(),
                    _showProgramInput(),
                    _showSemesterInput(),
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

//1
  _showTitle() {
    return Text(
      "Exploring Aadda Engineering Sarathi",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 19,
      ),
    );
  }

//2
  _showUsernameInput() {
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
        onSaved: (val) => _username = val,
        validator: (val) => val.length < 6 ? "Username is too short." : null,
        decoration: InputDecoration(
          hintText: "Enter Valid Username",
          icon: Icon(
            Icons.face,
            color: Constant.kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

//
  _showProgramInput() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 20, left: 10),
      padding: EdgeInsets.only(left: 30, right: 10),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(29),
        border: Border.all(color: Colors.white),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          hint: Text(
              '👉  Please choose Ur Programs'), // Not necessary for Option 1
          value: _selectedProgram,
          onChanged: (dynamic newValue) {
            setState(() {
              _selectedProgram = newValue;
            });
          },
          items: _programs.map((program) {
            return DropdownMenuItem(
              child: new Text(program),
              value: program,
            );
          }).toList(),
        ),
      ),
    );
  }

  _showSemesterInput() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 20, left: 10),
      padding: EdgeInsets.only(left: 30, right: 10),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(29),
        border: Border.all(color: Colors.white),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          hint: Text(
              '👉  Please choose Ur Semester'), // Not necessary for Option 1
          value: _selectedSemester,
          onChanged: (dynamic newValue) {
            setState(() {
              _selectedSemester = newValue;
            });
          },
          items: _semesters.map((semester) {
            return DropdownMenuItem(
              child: Text(semester),
              value: semester,
            );
          }).toList(),
        ),
      ),
    );
  }

//3
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

//

  _showSwitchScreen() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Already have an Account ? ",
            style: TextStyle(fontSize: 17, color: Constant.kPrimaryColor),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginPage();
                  },
                ),
              );
            },
            child: Text(
              "SignIn",
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

//4
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
          hintText: "Enter Valid Password",
          icon: Icon(
            Icons.lock,
            color: Constant.kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

//5
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        primary: Constant.kPrimaryColor,
                      ),
                      child: Text(
                        "SIGNUP",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      onPressed: _submit),
                ),
        ],
      ),
    );
  }

//6
  _submit() {
    final _form = _formKey.currentState;
    if (_form.validate()) {
      _form.save();
      //print("Email $_email, Password $_password, Username $_username");
      _registerUser();
    } else {
      print("Form is Invalid");
    }
  }

//7
  _registerUser() async {
    setState(() {
      _isSubmitting = true;
    });

    final logMessage = await context
        .read<AuthenticationService>()
        .signUp(email: _email, password: _password);

    logMessage == "Signed Up"
        ? _showSuccessSnack(logMessage)
        : _showErrorSnack(logMessage);

    print(logMessage);

    if (logMessage == "Signed Up") {
      createUserInFirestore();
    } else {
      setState(() {
        _isSubmitting = false;
      });
    }
  }

//When User "Signed Up", success snack will display.
  _showSuccessSnack(String message) {
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

//When FirebaseAuth Catches error, error snack will display.
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
  }

  createUserInFirestore() async {
    context.read<AuthenticationService>().addUserToDB(
          uid: auth.currentUser.uid,
          username: _username,
          email: auth.currentUser.email,
          university: _university,
          program: _selectedProgram,
          semester: _selectedSemester,
          timestamp: timestamp,
        );
  }
}
