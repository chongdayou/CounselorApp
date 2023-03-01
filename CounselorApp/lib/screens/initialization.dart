import 'package:flutter/material.dart';
import 'package:helloworld/shared/loading.dart';
import 'package:helloworld/services/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:helloworld/services/singleton.dart';
import 'package:helloworld/screens/homeScreenStudent.dart';
import 'package:helloworld/screens/homeScreenCreator.dart';

class InitializationScreen extends StatelessWidget {
  InitializationScreen({super.key});

  final Singleton _singleton = Singleton();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('user_data')
            .doc(Auth().user?.uid)
            .snapshots(),
        builder:
            ((BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingScreen();
          }

          print("Here is the data: ${snapshot.data}");
          if (snapshot.data!.data() != null) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            _singleton.userData = data;
            print("yes");
            if (data["account_type"] == "Creator") {
              // print("CREATOR PAGE");
              _singleton.accountType = "Creator";
              return homeScreenCreator();
            }
          }

          // print("STUDENT PAGE");
          _singleton.accountType = "Student";
          return homeScreenStudent();
        }));
  }
}
