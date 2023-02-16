import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:helloworld/services/singleton.dart';

class navigationBarCreator extends StatelessWidget {
  final int index;
  navigationBarCreator({super.key, required this.index});

  final Singleton _singleton = Singleton();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.house, size: 20),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.circleUser, size: 20),
          label: "profile",
        )
      ],
      onTap: (int idx) async {
        switch (idx) {
          case 0: // home
            if (_singleton.accountType == "Student") {
              Navigator.pushNamed(context, '/homeStudent');
            } else {
              Navigator.pushNamed(context, '/homeCreator');
            }

            break;
          case 1: // profile
            Navigator.pushNamed(context, '/profileCreator');

            break;
        }
      },
    );
  }
}
