import 'package:flutter/material.dart';

class RemoveNotes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Remove Notes',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: CircularProgressIndicator(backgroundColor: Colors.white),
      ),
    );
  }
}
