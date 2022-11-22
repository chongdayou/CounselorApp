import 'package:flutter/material.dart';
import "routes.dart";
import "package:firebase_core/firebase_core.dart";
import 'firebase_options.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> firebaseInitialization = Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: firebaseInitialization,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            routes: screenRoutes,
          );
        }
        return Text('testing');
      },
    );
  }
}

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // Application name
//       title: 'Flutter Hello World',
//       // Application theme data, you can set the colors for the application as
//       // you want
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       // A widget which will be started on application startup
//       home: const MyHomePage(title: 'hello hi'),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   final String title;
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // The title text which will be shown on the action bar
//         title: Text(title),
//       ),
//       body: Center(
//         child: Text(
//           'Hello, World!',
//         ),
//       ),
//     );
//   }
// }
