import 'package:flutter/material.dart';
import 'package:helloworld/services/services.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:helloworld/shared/bottomBarCreator.dart';

class profileCreatorScreen extends StatelessWidget {
  const profileCreatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    firebase_auth.User? user = Auth().user;
    String email = "User";
    if (user != null) {
      email = user.email as String;
    }
    return Scaffold(
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 0, //mediaquery
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/default.png', // 'assets/${filename}',
                fit: BoxFit.contain,
                scale: 15,
              ),
              Column(
                // sizedbox between each thing
                children: [
                  Text(
                    email,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const Text("Post #"),
                  const Text("Organization"), //change to a button type thing
                ],
              )
            ],
          ),
          const SizedBox(
            height: 0,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profileGeneral');
              },
              child: const Text('General')), //general screen
          //sizedbox
          ElevatedButton(
              onPressed: () {},
              child: const Text('Notification')), //notification screen
          // big sizedbox
          user == null
              ? TextButton(
                  onPressed: () {
                    Auth().signOut();
                    Navigator.pushNamed(context, "/login");
                  },
                  child: const Text("Log In"))
              : Container(), // appear if user is not login, otherwise do not appear
        ],
      )),
      bottomNavigationBar: navigationBarCreator(index: 1),
    );
  }
}
