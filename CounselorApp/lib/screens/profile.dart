import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/shared/bottomBar.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:helloworld/services/services.dart';

class profileScreen extends StatelessWidget {
  const profileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var user = Auth().user;
    return Scaffold(
      body: Container(
          child: Column(
        children: [
          Row(
            children: [
              Text("pfp"),
              Column(
                children: [
                  Text("Username"),
                  Text("School, Grade"),
                  Text("Interests"),
                ],
              )
            ],
          ),
          ElevatedButton(onPressed: () {}, child: null),
          ElevatedButton(onPressed: () {}, child: null),
          TextButton(onPressed: () {}, child: const Text("Log In")),
        ],
      )),
      bottomNavigationBar: const navigationBar(),
    );
  }
}
