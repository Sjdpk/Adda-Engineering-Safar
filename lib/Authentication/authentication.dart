import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationProvider {
  final FirebaseAuth firebaseAuth;
  //FirebaseAuth instance
  AuthenticationProvider(this.firebaseAuth);
  //Constuctor to initalize the FirebaseAuth instance

  //Using Stream to listen to Authentication State
  Stream<User> get authState => firebaseAuth.idTokenChanges();

  //............RUDIMENTARY METHODS FOR AUTHENTICATION................

  //SIGN UP METHOD
  Future<String> signUp({String email, String password}) async {
    try {
      final UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user.uid;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //SIGN IN METHOD
  Future<String> signIn({String email, String password}) async {
    try {
      final UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user.uid;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String> currentUser() async {
    final User user = firebaseAuth.currentUser;
    return user?.email;
  }

  //SIGN OUT METHOD
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}
