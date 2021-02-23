import 'package:adda/Models/note_data_details.dart';
import 'package:adda/Screens/Details/details_screen.dart';
import 'package:adda/Screens/Home/Components/notes_cards.dart';
import 'package:adda/Screens/Home/Components/semesters.dart';
import 'package:adda/Screens/Home/Components/welcome_message.dart';
import 'package:flutter/material.dart';

class AllNotes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      // shrinkWrap: true,
      // physics: ClampingScrollPhysics(),
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        welcomeMessage(),
        Semesters(),
        ListView.builder(
          padding: EdgeInsets.all(13),
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: 6,
          itemBuilder: (context, index) => Notescard(
            notesDataDetails: noteDetails[index],
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return DetailsScreen(noteDataDetails: noteDetails[index]);
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
