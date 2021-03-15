import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'Components/pdffromurl_page.dart';

class DetailsScreen extends StatefulWidget {
  final noteId,
      noteTitle,
      noteCredit,
      creditHour,
      noteProgram,
      noteSemester,
      coverImage,
      noteDetails,
      noteUrl;
  DetailsScreen({
    this.noteId,
    this.noteTitle,
    this.noteCredit,
    this.creditHour,
    this.noteProgram,
    this.noteSemester,
    this.coverImage,
    this.noteDetails,
    this.noteUrl,
  });
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;

  bool _isFavourite = false;

  @override
  Widget build(BuildContext context) {
    var isTrue = FirebaseFirestore.instance
        .collection('favouriteNotes')
        .doc(auth.currentUser.uid)
        .collection(widget.noteProgram)
        .doc(widget.noteId)
        .collection('isFavourite')
        .get()
        .toString();

    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.elliptical(20, 7),
            bottomRight: Radius.elliptical(20, 7),
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text(
          widget.noteTitle.toString().toUpperCase(),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              setState(
                () {
                  _isFavourite = !_isFavourite;
                  _isFavourite == true ? print('added') : print('removed');
                },
              );
              FirebaseFirestore.instance
                  .collection('favouriteNotes')
                  .doc(auth.currentUser.uid)
                  .collection(widget.noteProgram)
                  .doc(widget.noteId)
                  .set(
                {
                  'noteId': widget.noteId,
                  'noteTitle': widget.noteTitle,
                  'noteCredit': widget.noteCredit,
                  'creditHour': widget.creditHour,
                  'noteProgram': widget.noteProgram,
                  'noteSemester': widget.noteSemester,
                  'coverImage': widget.coverImage,
                  'noteDetails': widget.noteDetails,
                  'noteUrl': widget.noteUrl,
                  'isFavourite': _isFavourite,
                },
              );
            },
            icon: Icon(
              isTrue == 'true'
                  ? Icons.favorite_border_outlined
                  : Icons.favorite_border_outlined,
              color: Colors.red,
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(15),
        child: Container(
          child: Text(
            widget.noteTitle.toString().toUpperCase() +
                '   (' +
                widget.creditHour +
                ')',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
              fontSize: 22,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return PdfPage(
                      noteTitle: widget.noteTitle,
                      noteUrl: widget.noteUrl,
                    );
                  }),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  child: SvgPicture.asset(
                    widget.coverImage,
                    height: size.height / 2.5,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 4,
              child: Container(
                color: Colors.red,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    width: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.red,
                    ),
                    child: Icon(Icons.share_outlined),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 40,
                    width: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue,
                    ),
                    child: Icon(Icons.download_outlined),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 20),
              child: Text(
                'Note Credit : ' +
                    widget.noteCredit.toString().substring(0, 1).toUpperCase() +
                    widget.noteCredit.toString().substring(1),
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 20),
              child: Text(
                widget.noteDetails,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            isTrue == 'true' ? Text('False') : Text('True'),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 20, left: 10),
              padding: EdgeInsets.only(left: 30, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue,
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  primary: Colors.blue,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return PdfPage(
                          noteTitle: widget.noteTitle,
                          noteUrl: widget.noteUrl,
                        );
                      },
                    ),
                  );
                },
                child: Text(
                  "OPEN NOTES",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
