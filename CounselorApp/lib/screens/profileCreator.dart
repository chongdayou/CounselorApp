import 'package:flutter/material.dart';
import 'package:helloworld/services/services.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:helloworld/shared/bottomBarCreator.dart';
import 'package:helloworld/size_config.dart';
import 'package:helloworld/services/singleton.dart';

class profileCreatorScreen extends StatelessWidget {
  profileCreatorScreen({super.key});

  final Singleton _singleton = Singleton();

  @override
  Widget build(BuildContext context) {
    firebase_auth.User? user = Auth().user;
    String email = "User";
    if (user != null) {
      email = user.email as String;
    }
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 5, //mediaquery
          ),
          Card(
            color: Colors.blue.shade100,
            child: SizedBox(
                width: SizeConfig.blockSizeHorizontal! * 95,
                child: Column(
                  // sizedbox between each thing
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          'assets/default.png', // 'assets/${filename}',
                          fit: BoxFit.contain,
                          scale: SizeConfig.blockSizeHorizontal! * 2,
                        )),
                    Text(
                      email,
                      style: TextStyle(
                        fontSize: SizeConfig.blockSizeHorizontal! * 5,
                      ),
                    ),
                    Text(
                      "Post #: ${_singleton.userData!["posts"].length}",
                      style: TextStyle(fontSize: 20),
                    ),
                    const Text(
                      "Organization",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: SizeConfig.blockSizeVertical,
                    ) //change to a button type thing
                  ],
                )),
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical!,
          ),
          SizedBox(
              width: SizeConfig.blockSizeHorizontal! * 95,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {},
                  child:
                      const Text('My Card', style: TextStyle(fontSize: 30)))),
          SizedBox(
            height: SizeConfig.blockSizeVertical!,
          ),
          SizedBox(
              width: SizeConfig.blockSizeHorizontal! * 95,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/profileGeneral');
                  },
                  child: const Text('Settings',
                      style: TextStyle(fontSize: 30)))), //general screen
          SizedBox(
            height: SizeConfig.blockSizeVertical!,
          ),
          SizedBox(
              width: SizeConfig.blockSizeHorizontal! * 95,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Themes', style: TextStyle(fontSize: 30)))),
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
      ),
      bottomNavigationBar: navigationBarCreator(index: 1),
    );
  }
}
