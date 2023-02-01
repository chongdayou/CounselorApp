import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:helloworld/services/services.dart';

class navigationBarCreator extends StatelessWidget {
  final int index;
  const navigationBarCreator({super.key, required this.index});

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
          icon: Icon(FontAwesomeIcons.circleUser, size: 20),
          label: "profile",
        )
      ],
      onTap: (int idx) async {
        switch (idx) {
          case 0: // home
            Navigator.pushNamed(context, '/homeCreator');
            break;
          case 1: // profile
            Navigator.pushNamed(context, '/profileCreator');

            break;
        }
      },
      // selectedLabelStyle: TextStyle(),
    );
  }
}
