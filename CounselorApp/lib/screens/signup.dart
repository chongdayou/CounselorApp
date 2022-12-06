import 'package:flutter/material.dart';
import 'package:helloworld/services/services.dart';

// class MyWidget extends StatefulWidget {
//   const MyWidget({super.key});

//   @override
//   State<MyWidget> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<MyWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

class signupScreen extends StatefulWidget {
  const signupScreen({super.key});

  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signupScreen> {
  // signupScreen({Key? key}) : super(key: key);
  String email = '';
  TextEditingController emailController = TextEditingController();
  String password = '';
  TextEditingController passwordController = TextEditingController();
  String confirm = '';
  TextEditingController confirmationController = TextEditingController();
  bool matchingPasswords = false;

  void checkMatch(String password, String confirm) {
    if (password.isNotEmpty && password == confirm) {
      matchingPasswords = true;
    } else {
      matchingPasswords = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.topLeft,
                child: FloatingActionButton(
                    highlightElevation: 15,
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    mini: true,
                    child: const Icon(Icons.arrow_back_rounded),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ),
            ),

            SizedBox(
              height: 50,
            ),
            Text(
              'Sign Up',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 15,
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
              obscureText: true,
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
              height: 10,
            ),
            TextField(
              obscureText: true,
              controller: confirmationController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Confirm Password',
              ),
              onChanged: (text) {
                confirm = text;
                checkMatch(password, confirm);
              },
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: TextButton(
                //backgroundColor: Colors.blue,
                //padding: const EdgeInsets.symmetric(vertical: 20),
                // ignore: prefer_const_constructors
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 20)),
                ),
                child: Text('Get Verification',
                    style: TextStyle(color: Colors.white)),
                onPressed: matchingPasswords
                    ? () {
                        print("Attemping sign up");
                        Auth().accountCreation(email, password);
                        Auth().verifyEmail();
                        // TODO: redirect to another screen using Navigator
                        Navigator.pushNamed(context, '/verification');
                      }
                    : null, //textbox for problems
              ),
            ),

            //SizedBox(
            //height: 230,
            //),
          ],
        ),
      ),
    );
  }
}
