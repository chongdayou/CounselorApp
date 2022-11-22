import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/screens/login.dart';
import 'package:helloworld/screens/signup.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return loginScreen();
  }
}
