import 'package:helloworld/screens/login.dart';
import 'package:helloworld/screens/signup.dart';
import 'package:helloworld/screens/start.dart';
import 'package:helloworld/screens/verification.dart';
import 'package:helloworld/screens/homeScreenStudent.dart';
import 'package:helloworld/screens/homeScreenCreator.dart';
import 'package:helloworld/screens/profileStudent.dart';
import 'package:helloworld/screens/profileGeneral.dart';
import 'package:helloworld/screens/profileInterest.dart';
import 'package:helloworld/screens/profileNotification.dart';
import 'package:helloworld/screens/profileCreator.dart';
import 'package:helloworld/screens/createPost.dart';
import 'package:helloworld/screens/unsignedScreen.dart';
import 'package:helloworld/screens/initialization.dart';

var screenRoutes = {
  '/': (context) => startScreen(),
  '/login': (context) => loginScreen(),
  '/signup': (context) => const signupScreen(),
  '/verification': (context) => const verificationScreen(),
  '/homeStudent': (context) => homeScreenStudent(),
  '/homeCreator': (context) => homeScreenCreator(),
  '/profileStudent': (context) => profileStudentScreen(),
  '/profileCreator': (context) => profileCreatorScreen(),
  '/profileInterest': (context) => const profileInterestScreen(),
  '/profileGeneral': (context) => const profileGeneralScreen(),
  '/profileNotification': (context) => const profileNotificationScreen(),
  '/createPost': (context) => createPostScreen(),
  '/unsignedScreen': (context) => const UnsignedScreen(),
  '/initialization': (context) => InitializationScreen(),
};
