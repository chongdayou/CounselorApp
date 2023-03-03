import 'package:flutter/material.dart';
import 'package:helloworld/services/services.dart';

class profileGeneralScreen extends StatelessWidget {
  const profileGeneralScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
          onPressed: () async {
            await Auth().signOut();
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/', (route) => false);
          },
          child: const Text("Log Out")),
    );
  }
}

// Setting
// Privacy Seeting
// Organization (employee accounts)
// Log Out