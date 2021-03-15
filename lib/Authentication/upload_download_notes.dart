import '../Models/note_data_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UploadDownloadNotes {
  NoteDataDetails noteModel = NoteDataDetails();
  final CollectionReference noteRef =
      FirebaseFirestore.instance.collection("noteDetails");

//3
  Future<void> addNoteToDB({
    String noteId,
    noteTitle,
    noteCredit,
    creditHour,
    noteProgram,
    noteSemester,
    coverImage,
    noteDetails,
    noteUrl,
  }) async {
    noteDetails = NoteDataDetails(
      noteId: noteId,
      noteTitle: noteTitle,
      noteCredit: noteCredit,
      creditHour: creditHour,
      noteProgram: noteProgram,
      noteSemester: noteSemester,
      coverImage: coverImage,
      noteDetails: noteDetails,
      noteUrl: noteUrl,
    );
    await noteRef.doc(noteProgram).collection(noteSemester).doc(noteId).set(
          noteDetails.toMap(noteDetails),
        );
    // await userRef.doc(uid).set(userModel.toMap(userModel));
  }

//4
  Future<NoteDataDetails> getNoteFromDB(
      {String noteProgram, noteSemester, noteId}) async {
    final DocumentSnapshot doc = await noteRef
        .doc(noteProgram)
        .collection(noteSemester)
        .doc(noteId)
        .get();

    //print(doc.data());

    return NoteDataDetails.fromMap(doc.data());
  }
}
