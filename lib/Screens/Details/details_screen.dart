import 'package:adda/Models/note_data_details.dart';
import 'package:adda/components/constants.dart';
import 'package:adda/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'Components/pdffromurl_page.dart';

class DetailsScreen extends StatelessWidget {
  final NoteDataDetails noteDataDetails;
  DetailsScreen({this.noteDataDetails});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.blue,
          ),
        ),
        title: Text(
          noteDataDetails.noteTitle,
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => print('Favourite'),
            icon: Icon(
              Icons.favorite_border_outlined,
              color: Colors.blue,
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(15),
        child: Container(
          child: Text(
            noteDataDetails.noteTitle,
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
                      noteTitle: noteDataDetails.noteTitle,
                      noteUrl: noteDataDetails.noteUrl,
                    );
                  }),
                );
              },
              child: SvgPicture.asset(
                'assets/icons/wait.svg',
                height: size.height / 2.5,
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
                dummyDetails,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            RoundedButton(
              color: Constant.blueLight,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PdfPage(
                        noteTitle: noteDataDetails.noteTitle,
                        noteUrl: noteDataDetails.noteUrl,
                      );
                    },
                  ),
                );
              },
              text: 'Open PDF',
            ),
          ],
        ),
      ),
    );
  }
}
