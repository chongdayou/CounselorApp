import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/screens/login.dart';
import 'package:helloworld/screens/signup.dart';
import 'package:helloworld/services/services.dart';
import 'package:helloworld/screens/homeScreen.dart';

class startScreen extends StatelessWidget {
  startScreen({Key? key}) : super(key: key);
  String searchBar = "";
  TextEditingController searchBarController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().userStream,
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("loading");
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return homeScreen(); // replace with default screen
        }
      }),
    );
  }
}
