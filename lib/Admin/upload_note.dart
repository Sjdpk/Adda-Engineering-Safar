import 'package:adda/Authentication/upload_download_notes.dart';
import 'package:adda/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UploadNotes extends StatefulWidget {
  @override
  _UploadNotesState createState() => _UploadNotesState();
}

class _UploadNotesState extends State<UploadNotes> {
//To Toggle Password Text Visibility.
  String _noteId,
      _noteTitle,
      _noteCredit,
      _creditHour,
      _selectedProgram,
      _selectedSemester,
      _coverImage,
      _noteDetails,
      _noteUrl;
  List<String> _programs = [
    'BE-Civil',
    'BE-Elx & Com',
    'BE-Computer',
    'BE-IT',
    'BE-Software'
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
  final _formKey = GlobalKey<FormState>();

  final DateTime timestamp = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    _showTitle(),
                    _buildtextField(_noteId, "Course Code is too short.",
                        "Enter Valid Course Code", 6),
                    _buildtextField(_noteTitle, "Course Title is too short.",
                        "Enter Valid Course Title", 6),
                    _buildtextField(
                        _noteCredit,
                        "Invalid Course Provider Name.",
                        "Course Credit Goes To",
                        6),
                    _buildtextField(_creditHour, "Invalid Course Credit Hour.",
                        "Course Credit Hour", 1),
                    _showProgramInput(),
                    _showSemesterInput(),
                    _buildtextField(_coverImage, "Not Valid Url ",
                        "Paste Cover Image URL ", 8),
                    _buildtextField(_noteDetails, "Too Short Details ",
                        "Enter Note Details", 12),
                    _buildtextField(
                        _noteUrl, "Not Valid Url ", "Paste Note PDF URL ", 6),
                    _showFormActions(),
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
      "Uploaad Notes",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 19,
      ),
    );
  }

//2
  _buildtextField(String onSavedvalue, errorMsg, hitTextMsg, int lengthLimit) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 20, left: 10),
      padding: EdgeInsets.only(left: 30, right: 10),
      decoration: BoxDecoration(
        color: Constant.kPrimaryLightColor,
        borderRadius: BorderRadius.circular(29),
      ),
      child: TextFormField(
        cursorColor: Constant.kPrimaryColor,
        onSaved: (val) => onSavedvalue = val,
        validator: (val) => val.length < lengthLimit ? errorMsg : null,
        decoration: InputDecoration(
          hintText: hitTextMsg,
          icon: Icon(
            Icons.upload_file,
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
        color: Constant.kPrimaryLightColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          hint: Text(
              '👉  Please choose Ur Programs'), // Not necessary for Option 1
          value: _selectedProgram,
          onChanged: (newValue) {
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
        color: Constant.kPrimaryLightColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          hint: Text(
              '👉  Please choose Ur Semester'), // Not necessary for Option 1
          value: _selectedSemester,
          onChanged: (newValue) {
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

//

//4

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
                  child: RaisedButton(
                      child: Text(
                        "UPLOAD NOTES",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      color: Constant.kPrimaryColor,
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
      _registerNote();
    } else {
      print("Form is Invalid");
    }
  }

//7
  _registerNote() async {
    setState(() {
      _isSubmitting = true;
    });
    createNoteInFirestore();
  }

  createNoteInFirestore() async {
    context.read<UploadDownloadNotes>().addNoteToDB(
          noteId: _noteId,
          noteTitle: _noteTitle,
          noteCredit: _noteCredit,
          creditHour: _creditHour,
          noteProgram: _selectedProgram,
          noteSemester: _selectedSemester,
          coverImage: _coverImage,
          noteDetails: _noteDetails,
          noteUrl: _noteUrl,
        );
  }
}
