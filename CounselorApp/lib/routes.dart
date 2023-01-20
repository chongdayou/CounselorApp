// import screens here
//

// import 'package:my_app/about/about.dart';
import 'package:helloworld/screens/login.dart';
import 'package:helloworld/screens/signup.dart';
import 'package:helloworld/screens/home.dart';
import 'package:helloworld/screens/verification.dart';
import 'package:helloworld/screens/homeScreen.dart';
import 'package:helloworld/screens/profileStudent.dart';
import 'package:helloworld/screens/profileGeneral.dart';
import 'package:helloworld/screens/profileInterest.dart';
import 'package:helloworld/screens/profileNotification.dart';
import 'package:helloworld/screens/profileEmployer.dart';

// import 'package:my_app/profile/profile.dart';
// import 'package:my_app/login/login.dart';
// import 'package:my_app/topics/topics.dart';
// import 'package:my_app/home/home.dart';

var screenRoutes = {
  '/': (context) => startScreen(),
  '/login': (context) => loginScreen(),
  '/signup': (context) => signupScreen(),
  '/verification': (context) => verificationScreen(),
  '/home': (context) => homeScreen(),
  '/profileStudent': (context) => profileStudentScreen(),
  '/profileEmployer': (context) => profileEmployerScreen(),
  '/profileInterest': (context) => profileInterestScreen(),
  '/profileGeneral': (context) => profileGeneralScreen(),
  '/profileNotification': (context) => profileNotificationScreen(),
};
// var appRoutes = {
//   '/': (context) => const HomeScreen(),
//   '/login': (context) => LoginScreen(),
//   '/signup': (context) => const SignUp(),
//   '/topics': (context) => const TopicsScreen(),
//   '/profile': (context) => const ProfileScreen(),
//   '/about': (context) => const AboutScreen(),
// };

//            TextButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/signup');
//                 },
//                 child: const Text(
//                   'New User? Sign up!',
//                   style: TextStyle(color: Colors.grey, fontSize: 15),
//                 )),
