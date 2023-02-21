import 'package:cloud_firestore/cloud_firestore.dart';

class Singleton {
  static final Singleton _instance = Singleton._internal();

  // passes the instantiation to the _instance object
  factory Singleton() => _instance;

  //initialize variables in here
  Singleton._internal() {
    _myVariable = 0;
    // _accountType = "Student";
  }

  int _myVariable = 0;
  String accountType = "Student";
  Map<String, dynamic>? userData;
  Map<String, dynamic>? currentDocument;
  bool editDirty = false;
  List<DocumentSnapshot>? postsCache;

  //short getter for my variable
  int get myVariable => _myVariable;
  //short setter for my variable
  set myVariable(int value) => _myVariable = value;

  void incrementMyVariable() => _myVariable++;
}
