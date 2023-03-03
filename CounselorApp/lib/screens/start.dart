import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/shared/loading.dart';
import 'package:helloworld/services/services.dart';
import 'package:helloworld/screens/initialization.dart';
import 'package:helloworld/screens/verification.dart';
import 'package:helloworld/services/singleton.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:helloworld/size_config.dart';

class startScreen extends StatelessWidget {
  startScreen({Key? key}) : super(key: key);

  Singleton _singleton = Singleton();

  String searchBar = "";
  TextEditingController searchBarController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return StreamBuilder(
      stream: Auth().userStream,
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingScreen();
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          if (snapshot.hasData) {
            print("User is currently logged in.");
            firebase_auth.User userData = snapshot.data as firebase_auth.User;
            // if (!userData.emailVerified) {
            if (false) {
              // If the user is not yet verified
              Auth().verifyEmail(userData);
              return verificationScreen();
            } else {
              // User is already verified
              // print("TESTING");

              // final docRef = FirebaseFirestore.instance
              //     .collection("user_data")
              //     .doc(userData.uid);
              // docRef.get().then(
              //   (DocumentSnapshot doc) {
              //     final data = doc.data() as Map<String, dynamic>;
              //     _singleton.userData = data;
              //     // ...
              //     if (data["account_type"] == "Student") {
              //       print("STUDENT PAGE");
              //       _singleton.accountType = "Student";
              //       // return homeScreenStudent();
              //     } else {
              //       print("CREATOR PAGE");
              //       _singleton.accountType = "Creator";
              //       // return homeScreenCreator();
              //     }
              //   },
              //   onError: (e) => print("Error getting document: $e"),
              // );
            }
          }

          // if (_singleton.accountType == "Student") {
          //   return homeScreenStudent(); // replace with default screen
          // } else {
          //   return homeScreenCreator();
          // }
          return InitializationScreen();
        }
      }),
    );
  }
}
