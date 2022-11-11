import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class loginScreen extends StatelessWidget {
  loginScreen({Key? key}) : super(key: key);

  String email = "";
  TextEditingController emailController = TextEditingController();
  String password = '';
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Log In',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: emailController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
            ),
            onChanged: (text) {
              email = text;
            },
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
            onChanged: (text) {
              password = text;
            },
          ),
          SizedBox(
            width: 50, //does not work
            height: 100,
            child: ElevatedButton.icon(
                icon: const Icon(FontAwesomeIcons.circleArrowRight),
                style: TextButton.styleFrom(
                    padding: EdgeInsets.all(50), backgroundColor: Colors.blue),
                onPressed: () {},
                label: const Text("")),
          ),
          SizedBox(
            height: 30,
          ),
          OutlinedButton(
              child: Text('New User? Sign Up Here',
                  style: TextStyle(color: Colors.blue)),
              onPressed: () {}),

          // SizedBox(
          //   height: 50,
          // ),
          // ElevatedButton(
          //   labelText: 'New User? Sign up here',
          //   style: ,
          //   onPressed: Navigator.pushNamed(context, '/signup')
          // ),

          /*
            Flexible(
              child: ElevatedButton.icon(
                icon: const Icon(
                  FontAwesomeIcons.user,
                  color: Colors.white,
                  size: 20,
                ),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(24),
                  backgroundColor: Colors.blue,
                ),
                onPressed: () => Authentication().emailLogin(email, password),
                label: const Text('Sign In', textAlign: TextAlign.center),
              ),
            ),
             */
        ],
      ),
      padding: EdgeInsets.all(20),
    ));
  }
}
