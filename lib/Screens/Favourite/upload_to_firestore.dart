// import 'dart:io';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart'; // For Image Picker
// import 'package:path/path.dart' as Path;

// class FileUploadToFireStorage extends StatefulWidget {
//   @override
//   _FileUploadToFireStorageState createState() =>
//       _FileUploadToFireStorageState();
// }

// class _FileUploadToFireStorageState extends State<FileUploadToFireStorage> {
//   File _image;
//   String _uploadedFileURL;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Firestore File Upload'),
//       ),
//       body: Center(
//         child: Column(
//           children: <Widget>[
//             Text('Selected Image'),
//             _image != null
//                 ? Image.asset(
//                     _image.path,
//                     height: 150,
//                   )
//                 : Container(height: 150),
//             _image == null
//                 ? RaisedButton(
//                     child: Text('Choose File'),
//                     onPressed: chooseFile,
//                     color: Colors.cyan,
//                   )
//                 : Container(),
//             _image != null
//                 ? RaisedButton(
//                     child: Text('Upload File'),
//                     onPressed: uploadFile,
//                     color: Colors.cyan,
//                   )
//                 : Container(),
//             _image != null
//                 ? RaisedButton(
//                     child: Text('Clear Selection'),
//                     onPressed: () {},
//                   )
//                 : Container(),
//             Text('Uploaded Image'),
//             _uploadedFileURL != null
//                 ? Image.network(
//                     _uploadedFileURL,
//                     height: 150,
//                   )
//                 : Container(),
//           ],
//         ),
//       ),
//     );
//   }

//   //
//   Future chooseFile() async {
//     // ignore: deprecated_member_use
//     await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
//       setState(() {
//         _image = image;
//       });
//     });
//   }

// //
//   Future uploadFile() async {
//     FirebaseStorage storage = FirebaseStorage.instance;
//     Reference ref = storage.ref().child('chats/${Path.basename(_image.path)}}');
//     UploadTask uploadTask = ref.putFile(_image);

//     uploadTask.whenComplete(() {
//       ref.getDownloadURL().then((fileURL) {
//         setState(() {
//           _uploadedFileURL = fileURL;
//         });
//       });
//     }).catchError((onError) {
//       print(onError);
//     });
//     return _uploadedFileURL;
//   }
//   //
// }
