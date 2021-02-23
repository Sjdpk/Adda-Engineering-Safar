import '../Explore/Components/search_button.dart';
import 'package:flutter/material.dart';

class ExploreNotes extends StatefulWidget {
  @override
  _ExploreNotesState createState() => _ExploreNotesState();
}

class _ExploreNotesState extends State<ExploreNotes> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SearchButton(
          hintText: "Search for anythings",
          onChanged: (value) {},
        ),
      ],
    );
  }
}
