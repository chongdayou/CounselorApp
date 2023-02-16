import 'package:flutter/material.dart';
import 'package:helloworld/services/services.dart';

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

  String? dropdownValue = "Student";
  var items = ["Student", "Creator"];

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(10),
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

          const SizedBox(
            height: 50,
          ),
          const Text(
            'Sign Up',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          const SizedBox(
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
          const SizedBox(
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
          const SizedBox(
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
          const SizedBox(
            height: 30,
          ),
          DropdownButton(
            value: dropdownValue,
            icon: const Icon(Icons.keyboard_arrow_down),
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue;
              });
            },
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: TextButton(
              //backgroundColor: Colors.blue,
              //padding: const EdgeInsets.symmetric(vertical: 20),
              // ignore: prefer_const_constructors
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 20)),
              ),
              onPressed: matchingPasswords
                  ? () {
                      print("Attemping sign up");
                      Auth().accountCreation(email, password, dropdownValue);
                      // Auth().verifyEmail();
                      Navigator.pushNamed(context, '/verification');
                    }
                  : null,
              child: const Text('Get Verification',
                  style: TextStyle(color: Colors.white)), //textbox for problems
            ),
          ),

          //SizedBox(
          //height: 230,
          //),
        ],
      ),
    );
  }
}
