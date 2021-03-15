import 'package:adda/Admin/remove_notes.dart';
import 'package:adda/Authentication/authentication_service.dart';
import 'package:provider/provider.dart';
import '../../Admin/upload_note.dart';
// import 'package:adda/Screens/Favourite/upload_to_firestore.dart';

import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle _textStyle = TextStyle(color: Colors.white);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(Icons.cancel_sharp, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'Profile Pannel',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            // Container(
            //   margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            //   decoration: BoxDecoration(
            //     color: Colors.black45,
            //     borderRadius: BorderRadius.circular(20),
            //   ),
            //   child: ListTile(
            //     onTap: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) {
            //             return UploadNotes();
            //           },
            //         ),
            //       );
            //     },
            //     title: Text(
            //       'Upload Notes',
            //       style: _textStyle,
            //     ),
            //     trailing: Icon(
            //       Icons.add_comment_outlined,
            //       color: Colors.white,
            //     ),
            //   ),
            // ),
            buildListView(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return UploadNotes();
                      },
                    ),
                  );
                },
                listName: 'Upload Notes',
                textStyle: _textStyle,
                icon: Icon(Icons.add_circle_outlined)),
            buildListView(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return RemoveNotes();
                      },
                    ),
                  );
                },
                listName: 'Remove Notes',
                textStyle: _textStyle,
                icon: Icon(Icons.remove_circle_outline)),
          ],
        ),
      ),
      bottomNavigationBar: ListTile(
        onTap: () {
          context.read<AuthenticationService>().signOut();
        },
        title: Text(
          'LOGOUT',
          style: _textStyle,
        ),
        trailing: Icon(
          Icons.exit_to_app,
          color: Colors.white,
        ),
      ),
    );
  }
}

Widget buildListView(
    {Function press, String listName, TextStyle textStyle, Icon icon}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    decoration: BoxDecoration(
      color: Colors.black45,
      borderRadius: BorderRadius.circular(20),
    ),
    child: ListTile(
      onTap: press as void Function(),
      title: Text(
        // 'Upload Notes',
        listName,
        // style: _textStyle,
        style: textStyle,
      ),
      trailing: icon,
    ),
  );
}
