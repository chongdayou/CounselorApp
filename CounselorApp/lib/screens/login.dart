import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:helloworld/services/services.dart';
import 'package:helloworld/size_config.dart';

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
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Counselor App',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: emailController,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(),
              labelText: 'Email',
            ),
            onChanged: (text) {
              email = text;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            obscureText: true,
            controller: passwordController,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
            onChanged: (text) {
              password = text;
            },
          ),
          // SizedBox(
          //   width: 50, //does not work
          //   height: 100,
          //   child: ElevatedButton.icon(
          //       icon: const Icon(FontAwesomeIcons.circleArrowRight),
          //       style: TextButton.styleFrom(
          //           padding: const EdgeInsets.all(50),
          //           backgroundColor: Colors.blue),
          //       onPressed: () {
          //         Auth().logIn(email, password);
          //         Navigator.of(context)
          //             .pushNamedAndRemoveUntil('/', (route) => false);
          //       },
          //       label: const Text("")),
          // ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
              width: SizeConfig.blockSizeHorizontal! * 95,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    Auth().logIn(email, password);
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil('/', (route) => false);
                  },
                  child: const Text('Login', style: TextStyle(fontSize: 30)))),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white)),
              child: const Text('New User? Sign Up Here',
                  style: TextStyle(color: Colors.blue)),
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              }),
        ],
      ),
    ));
  }
}
