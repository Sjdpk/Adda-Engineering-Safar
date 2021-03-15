import 'dart:io';

import 'package:file_picker/file_picker.dart';

import '../components/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as Path;

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
      _noteDetails;
  // _noteUrl;
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
  File _file;
  String _uploadedFileURL;
  final _borderStyle = Border.all(color: Colors.white, width: 1);
  final _textStyle = TextStyle(color: Colors.white);
  final _hintStyle = TextStyle(color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context)),
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: _showTitle(),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  _buildUidField(),
                  _buildTitleField(),
                  _buildCreditGoesToField("Invalid Course Provider Name.",
                      "Course Credit Goes To", 6),
                  _buildCreditHoursField(
                      "Invalid Course Credit Hour.", "Course Credit Hour", 1),
                  _showProgramInput(),
                  _showSemesterInput(),
                  _chooseNote(),
                  _buildDetailsField(
                      "Too Short Details ", "Enter Note Details", 12),
                  // _buildURLField("Not Valid Url ", "Paste Note PDF URL ", 6),
                  _showFormActions(),
                ],
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
      "Uploaad Notes".toUpperCase(),
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 19,
        color: Colors.white,
        letterSpacing: 2,
      ),
    );
  }

//UID
  _buildUidField() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 20, left: 10),
      padding: EdgeInsets.only(left: 30, right: 10),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(29),
        border: _borderStyle,
      ),
      child: TextFormField(
        style: _textStyle,
        cursorColor: Colors.white,
        onSaved: (val) => _noteId = val,
        validator: (val) => val.length < 6 ? "Course Code is too short." : null,
        decoration: InputDecoration(
          hintStyle: _hintStyle,
          hintText: "Enter Valid Course Code",
          icon: Icon(
            Icons.upload_file,
            color: Constant.kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

// Title Field
  _buildTitleField() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 20, left: 10),
      padding: EdgeInsets.only(left: 30, right: 10),
      decoration: BoxDecoration(
        color: Colors.black,
        border: _borderStyle,
        borderRadius: BorderRadius.circular(29),
      ),
      child: TextFormField(
        style: _textStyle,
        cursorColor: Constant.kPrimaryColor,
        onSaved: (val) => _noteTitle = val,
        validator: (val) =>
            val.length < 6 ? "Course Title is too short." : null,
        decoration: InputDecoration(
          hintStyle: _hintStyle,
          hintText: "Enter Valid Course Title",
          icon: Icon(
            Icons.upload_file,
            color: Constant.kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

// Course Credit Goes To
  _buildCreditGoesToField(String errorMsg, hitTextMsg, int lengthLimit) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 20, left: 10),
      padding: EdgeInsets.only(left: 30, right: 10),
      decoration: BoxDecoration(
        color: Colors.black,
        border: _borderStyle,
        borderRadius: BorderRadius.circular(29),
      ),
      child: TextFormField(
        style: _textStyle,
        cursorColor: Constant.kPrimaryColor,
        onSaved: (val) => _noteCredit = val,
        validator: (val) => val.length < lengthLimit ? errorMsg : null,
        decoration: InputDecoration(
          hintStyle: _hintStyle,
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

  _buildCreditHoursField(String errorMsg, hitTextMsg, int lengthLimit) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 20, left: 10),
      padding: EdgeInsets.only(left: 30, right: 10),
      decoration: BoxDecoration(
        color: Colors.black,
        border: _borderStyle,
        borderRadius: BorderRadius.circular(29),
      ),
      child: TextFormField(
        style: _textStyle,
        cursorColor: Constant.kPrimaryColor,
        onSaved: (val) => _creditHour = val,
        validator: (val) => val.length < lengthLimit ? errorMsg : null,
        decoration: InputDecoration(
          hintStyle: _hintStyle,
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
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
        border: _borderStyle,
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.black,
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            hint: Text(
              '👉  Please choose Ur Programs',
              style: _hintStyle,
            ), // Not necessary for Option 1
            value: _selectedProgram,
            onChanged: (dynamic newValue) {
              setState(() {
                _selectedProgram = newValue;
              });
            },
            items: _programs.map((program) {
              return DropdownMenuItem(
                child: new Text(
                  program,
                  style: _textStyle,
                ),
                value: program,
              );
            }).toList(),
          ),
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
        borderRadius: BorderRadius.circular(20),
        border: _borderStyle,
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.black,
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            hint: Text(
              '👉  Please choose Ur Semester',
              style: _hintStyle,
            ), // Not necessary for Option 1
            value: _selectedSemester,
            onChanged: (dynamic newValue) {
              setState(() {
                _selectedSemester = newValue;
              });
            },
            items: _semesters.map((semester) {
              return DropdownMenuItem(
                child: Text(
                  semester,
                  style: _textStyle,
                ),
                value: semester,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

//
  _chooseNote() {
    return Center(
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: _file == null ? chooseFile : uploadFile,
            child: Container(
              alignment: Alignment.centerLeft,
              height: 40,
              width: double.infinity,
              margin: EdgeInsets.only(top: 20, left: 10, bottom: 10),
              padding: EdgeInsets.only(left: 30, right: 10),
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                  border: _borderStyle),
              child: _file == null
                  ? Text(
                      'Select PDF File',
                      style: _hintStyle,
                    )
                  : Text('Upload PDF File'),
            ),
          ),
          _uploadedFileURL != null
              ? Text(_uploadedFileURL)
              : Text(
                  'Please Select Respective PDF',
                  style: _hintStyle,
                ),
        ],
      ),
    );
  }

  Future chooseFile() async {
    FilePickerResult result = await FilePicker.platform
        .pickFiles()
        .onError((error, stackTrace) => null);

    if (result != null) {
      _file = File(result.files.single.path);
    } else {
      // User canceled the picker
      return 'Sorry';
    }
  }

//
  Future uploadFile() async {
    FirebaseStorage storage = FirebaseStorage.instance;

    Reference ref = storage.ref().child(
        '$_selectedProgram/$_selectedSemester/${Path.basename(_file.path)}');
    UploadTask uploadTask = ref.putFile(_file);

    uploadTask.whenComplete(() {
      ref.getDownloadURL().then((fileURL) {
        setState(() {
          _uploadedFileURL = fileURL;
        });
      });
    }).catchError((onError) {
      print(onError);
    });
    return _uploadedFileURL;
  }

//
//COurse Details
  _buildDetailsField(String errorMsg, hitTextMsg, int lengthLimit) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 30, left: 10),
      padding: EdgeInsets.only(left: 30, right: 10),
      decoration: BoxDecoration(
        color: Colors.black,
        border: _borderStyle,
        borderRadius: BorderRadius.circular(29),
      ),
      child: TextFormField(
        style: _textStyle,
        cursorColor: Constant.kPrimaryColor,
        onSaved: (val) => _noteDetails = val,
        validator: (val) => val.length < lengthLimit ? errorMsg : null,
        decoration: InputDecoration(
          hintStyle: _hintStyle,
          hintText: hitTextMsg,
          icon: Icon(
            Icons.upload_file,
            color: Constant.kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
        maxLines: 4,
        maxLength: 150,
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
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      primary: Constant.kPrimaryColor,
                    ),
                    child: Text(
                      "UPLOAD NOTES",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    onPressed: _submit,
                  ),
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
    FirebaseFirestore.instance
        .collection('noteDetails')
        .doc(_selectedProgram)
        .collection(_selectedSemester)
        .doc(_noteId)
        .set({
      "noteId": _noteId.toUpperCase(),
      "noteTitle": _noteTitle,
      "noteCredit":
          _noteCredit.substring(0, 1).toUpperCase() + _noteCredit.substring(1),
      "creditHour": _creditHour,
      "noteProgram": _selectedProgram,
      "noteSemester": _selectedSemester,
      "coverImage": _selectedProgram == 'BE-Civil'
          ? 'assets/images/civil.svg'
          : _selectedProgram == 'BE-Elx & Com'
              ? 'assets/images/elx.svg'
              : _selectedProgram == 'BE-Computer'
                  ? 'assets/images/computer.svg'
                  : _selectedProgram == 'BE-IT'
                      ? 'assets/images/it.svg'
                      : 'assets/images/software.svg',
      "noteDetails": _noteDetails,
      "noteUrl": _uploadedFileURL,
    }).then(
      (value) => setState(
        () {
          _isSubmitting = false;

          // _noteUrl;

          return;
        },
      ),
    );
  }
}
