import 'package:flutter/material.dart';

class verificationScreen extends StatelessWidget {
  const verificationScreen({Key? key}) : super(key: key);
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
                    //Navigator.pop(context);
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil('/', (route) => false);
                  }),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            'Verfication Page',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            'Please click the link in the Email we just sent to you to verify your Email.',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
