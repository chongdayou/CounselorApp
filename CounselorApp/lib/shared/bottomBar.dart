import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:helloworld/services/services.dart';

class navigationBar extends StatelessWidget {
  final int index;
  const navigationBar({super.key, required this.index});

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
            String type = "Student";
            // String type = await Auth().getAccountType();
            // print("Current account page type: ${type}");
            if (type == "Student") {
              Navigator.pushNamed(context, '/homeStudent');
            } else {
              Navigator.pushNamed(context, '/homeCreator');
            }
            break;
          case 1: // for you
            //do thing
            break;
          case 2: // profile
            String type = "Student";
            // String type = await Auth().getAccountType();
            // print("Current account page type: ${type}");
            if (type == "Student") {
              Navigator.pushNamed(context, '/profileStudent');
            } else {
              Navigator.pushNamed(context, '/profileCreator');
            }

            break;
        }
      },
      // selectedLabelStyle: TextStyle(),
    );
  }
}
