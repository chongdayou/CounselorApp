import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/shared/bottomBar.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:helloworld/services/services.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class profileStudentScreen extends StatelessWidget {
  const profileStudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    firebase_auth.User? user = Auth().user;
    String email = "User";
    if (user != null) {
      email = user.email as String;
    }
    print(user);
    return Scaffold(
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 30, //mediaquery
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/default.png', // 'assets/${filename}',
                fit: BoxFit.contain,
                scale: 5,
              ),
              Column(
                // sizedbox between each thing
                children: [
                  Text(
                    email,
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                  Text(
                    "School, Grade",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Interests",
                    style: TextStyle(fontSize: 20),
                  ), //change to a button type thing
                ],
              )
            ],
          ),
          SizedBox(
            height: 0,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2 - 10,
            height: 50,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/profileGeneral');
                },
                child: const Text(
                  'General',
                  style: TextStyle(fontSize: 30),
                )), //general screen,
          ),

          //sizedbox
          // ElevatedButton(
          //     onPressed: () {},
          //     child: const Text('Notification')), //notification screen
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
      bottomNavigationBar: navigationBar(index: 2),
    );
  }
}
