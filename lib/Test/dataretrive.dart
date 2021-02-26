import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class GetUserName extends StatelessWidget {
  final String documentId = '2lgbFZO7WBRZSvfPQBAR';

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('testData');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          return Text("Full Name: ${data['full_name']} ${data['company']}");
        }

        return Text("loading");
      },
    );
  }
}
