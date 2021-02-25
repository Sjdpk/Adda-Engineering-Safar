import 'package:adda/Admin/upload_note.dart';
import 'package:flutter/material.dart';

import '../Favourite/Components/search_button.dart';
import 'package:flutter/cupertino.dart';

class FavouriteNotes extends StatefulWidget {
  @override
  _FavouriteNotesState createState() => _FavouriteNotesState();
}

class _FavouriteNotesState extends State<FavouriteNotes> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SearchButton(
          hintText: "Search for anythings",
          onChanged: (value) {},
        ),
        OutlineButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return UploadNotes();
                },
              ),
            );
          },
          child: Text('upload Notes'),
        ),
      ],
    );
  }
}
