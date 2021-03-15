import '../components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoteDataDetails {
  String noteId,
      noteTitle,
      noteCredit,
      creditHour,
      noteProgram,
      noteSemester,
      coverImage,
      noteDetails,
      noteUrl;
  Color color;

  NoteDataDetails({
    this.noteId,
    this.noteTitle,
    this.noteCredit,
    this.creditHour,
    this.noteProgram = 'Civil',
    this.noteSemester,
    this.coverImage,
    this.noteDetails = 'Learn with Adda-Engineering safari',
    this.noteUrl =
        'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',
    this.color = Colors.lightBlue,
  });

  Map toMap(NoteDataDetails note) {
    var data = Map<String, dynamic>();

    data["noteId"] = note.noteId;
    data["noteTitle"] = note.noteTitle;
    data["noteCredit"] = note.noteCredit;
    data['creditHour'] = note.creditHour;
    data['noteProgram'] = note.noteProgram;
    data['noteSemester'] = note.noteSemester;
    data["coverImage"] = note.coverImage;
    data['noteDetails'] = note.noteDetails;
    data["noteUrl"] = note.noteUrl;

    return data;
  }

  NoteDataDetails.fromMap(Map<String, dynamic> mapData) {
    this.noteId = mapData['noteId'];
    this.noteTitle = mapData['noteTitle'];
    this.noteCredit = mapData['noteCredit'];
    this.creditHour = mapData['creditHour'];
    this.noteProgram = mapData['noteProgram'];
    this.noteSemester = mapData['noteSemester'];
    this.coverImage = mapData['coverImage'];
    this.noteDetails = mapData['noteDetails'];
    this.noteUrl = mapData['noteUrl'];
  }
}

final List<NoteDataDetails> noteDetails = [
  NoteDataDetails(
      noteId: 'cmp345',
      noteTitle: 'Applied Operating System',
      noteCredit: 'Deepak Sapkota',
      creditHour: '3',
      noteProgram: 'BE-IT',
      noteSemester: '01',
      coverImage: 'assets/images/img.jpg',
      color: Constant.salmonLight,
      noteUrl:
          'https://firebasestorage.googleapis.com/v0/b/adaa-engineering-safar.appspot.com/o/IT-Engineering%2F5th%20Semester%2FApplied%20Operating%20System.pdf?alt=media&token=33c6e3b7-394f-4a47-b492-cd8505f77fc1'),
  NoteDataDetails(
    noteId: 'cmp342',
    noteTitle: 'Basic Electrical Engineering',
    noteCredit: 'Ashirwad Tamang',
    creditHour: '3',
    noteProgram: 'Elx',
    noteSemester: '01',
    coverImage: 'assets/images/img.jpg',
    color: Constant.lightYellow,
  ),
  NoteDataDetails(
    noteId: 'cmp335',
    noteTitle: 'Programming in C',
    noteCredit: 'Sagar Bist',
    creditHour: '3',
    noteProgram: 'Computer',
    noteSemester: '01',
    coverImage: 'assets/images/img.jpg',
    color: Constant.grey,
  ),
  NoteDataDetails(
    noteId: 'cmp345',
    noteTitle: 'Engineering Mathematics I',
    noteCredit: 'Deepak Sapkota',
    creditHour: '3',
    noteSemester: '01',
    coverImage: 'assets/images/img.jpg',
    color: Constant.lightPink,
  ),
  NoteDataDetails(
    noteId: 'cmp342',
    noteTitle: 'Basic Electrical Engineering',
    noteCredit: 'Ashirwad Tamang',
    creditHour: '3',
    noteSemester: '01',
    coverImage: 'assets/images/img.jpg',
    color: Constant.lightViolet,
  ),
  NoteDataDetails(
    noteId: 'cmp335',
    noteTitle: 'Programming in C',
    noteCredit: 'Sagar Bist',
    creditHour: '3',
    noteSemester: '01',
    coverImage: 'assets/images/img.jpg',
    color: Constant.lightPrimary,
  ),
];

String dummyDetails =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
