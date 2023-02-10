import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:helloworld/services/services.dart';
import 'package:helloworld/services/singleton.dart';

class navigationBar extends StatelessWidget {
  final int index;
  navigationBar({super.key, required this.index});

  Singleton _singleton = Singleton();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      items: [
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.home, size: 20),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.graduationCap, size: 20),
          label: "For You",
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
            } else if (_singleton.userData != null) {
              Navigator.pushNamed(context, '/homeCreator');
            }

            break;
          case 1: // for you
            //do thing
            break;
          case 2: // profile
            Navigator.pushNamed(context, '/profileStudent');
            break;
        }
      },
      // selectedLabelStyle: TextStyle(),
    );
  }
}
