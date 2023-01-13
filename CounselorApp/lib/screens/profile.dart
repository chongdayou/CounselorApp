import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/shared/bottomBar.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:helloworld/services/services.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class profileScreen extends StatelessWidget {
  const profileScreen({super.key});

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
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text("School, Grade"),
                  Text("Interests"), //change to a button type thing
                ],
              )
            ],
          ),
          SizedBox(
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
              ? TextButton(onPressed: () {}, child: const Text("Log In"))
              : Container(), // appear if user is not login, otherwise do not appear
        ],
      )),
      bottomNavigationBar: const navigationBar(index: 2),
    );
  }
}
