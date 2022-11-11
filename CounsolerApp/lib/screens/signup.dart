import 'package:flutter/material.dart';

class signupScreen extends StatelessWidget {
  signupScreen({Key? key}) : super(key: key);
  String email = '';
  TextEditingController emailController = TextEditingController();
  String password = '';
  TextEditingController passwordController = TextEditingController();
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
                    onPressed: () {}),
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
                  onPressed: () {}),
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
