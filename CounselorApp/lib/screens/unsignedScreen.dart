import 'package:flutter/material.dart';
import 'package:helloworld/shared/bottomBar.dart';

class UnsignedScreen extends StatelessWidget {
  const UnsignedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "No user currently signed in.\nPlease press the button below to login.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 40),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 10,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 30),
                    )), //general screen,
              ),
            ]),
      ),
      bottomNavigationBar: navigationBar(index: 2),
    );
  }
}
