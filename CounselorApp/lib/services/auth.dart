import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Auth {
  final userStream = FirebaseAuth.instance.authStateChanges();
  final user = FirebaseAuth.instance.currentUser;
  String accountType = "Student";

  Future<void> logIn(logIn_username, logIn_password) async {
    try {
      final logInAttempt = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: logIn_username, password: logIn_password);

      // User? user = logInAttempt.user;
      // var snapshot = await FirebaseFirestore.instance
      //     .collection('user_data')
      //     .doc(user?.uid)
      //     .get();
      // print("TESTING: ${snapshot["account_type"]}");
      // accountType = snapshot["account_type"];
    } on FirebaseAuthException catch (error) {
      if (error.code == 'user-not-found') {
        print('username unfound'); // TODO: replace with UI element
      } else if (error.code == 'wrong-password') {
        print('wrong password');
      }
    }
  }

  Future<String> getAccountType() async {
    User? user = FirebaseAuth.instance.currentUser;
    var snapshot = await FirebaseFirestore.instance
        .collection('user_data')
        .doc(user?.uid)
        .get();
    print("TESTING: ${snapshot["account_type"]}");
    return snapshot["account_type"];
  }

  Future<void> accountCreation(
      creation_email, creation_password, account_type) async {
    try {
      final accountCreateAttempt = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: creation_email, password: creation_password);
      User? user = accountCreateAttempt.user;
      accountType = account_type;
      FirebaseFirestore.instance
          .collection('user_data')
          .doc(user?.uid)
          .set({'account_type': account_type});
    } on FirebaseAuthException catch (error) {
      if (error.code == 'weak-password') {
        print('password is way too weak'); // TODO: replace with UI element
      } else if (error.code == 'email-already-in-use') {
        print('email is already in use');
      } else if (error.code == 'invalid-email') {
        print('this email address does not exist');
      }
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> verifyEmail(user) async {
    // User? user = FirebaseAuth.instance.currentUser;
    if (user != null && !user.emailVerified) {
      print("User was sent an email!");
      await user.sendEmailVerification();
    } else if (user == null) {
      print("Hmm, user does not seem to exist");
    } else {
      print(user.emailVerified);
    }
  }
}
