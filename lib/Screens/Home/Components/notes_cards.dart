import '../../../Models/note_data_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Notescard extends StatelessWidget {
  final NoteDataDetails notesDataDetails;
  final Function press;
  Notescard({
    this.notesDataDetails,
    this.press,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(29),
        color: notesDataDetails.color,
      ),
      alignment: Alignment.center,
      child: ListTile(
        leading: ClipOval(
          child: Image(
            image: AssetImage(notesDataDetails.coverImage),
            height: 30,
          ),
        ),
        title: Text(notesDataDetails.noteTitle),
        subtitle: Text(notesDataDetails.noteCredit),
        onTap: press as void Function(),
        trailing: SvgPicture.asset(
          'assets/icons/play.svg',
          color: Colors.orangeAccent,
          height: 30,
        ),
      ),
    );
  }
}
