import 'package:adda/Admin/upload_note.dart';

import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return UploadNotes();
                  },
                ),
              );
            },
            title: Text('Upload Notes'),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return;
                  },
                ),
              );
            },
            title: Text('Load Test Data'),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return;
                  },
                ),
              );
            },
            title: Text('Retrive Test Data'),
          ),
        ],
      ),
    );
  }
}
