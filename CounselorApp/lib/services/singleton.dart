import 'package:cloud_firestore/cloud_firestore.dart';

class Singleton {
  static final Singleton _instance = Singleton._internal();

  // passes the instantiation to the _instance object
  factory Singleton() => _instance;

  //initialize variables in here
  Singleton._internal() {
    _myVariable = 0;
    _accountType = "Student";
  }

  int _myVariable = 0;
  String _accountType = "Student";
  Map<String, dynamic>? _userData;
  Map<String, dynamic>? _currentDocument;

  //short getter for my variable
  int get myVariable => _myVariable;

  //short getter for account type
  String get accountType => _accountType;

  //short setter for my variable
  set myVariable(int value) => _myVariable = value;

  //short setter for account type
  set accountType(String value) => _accountType = value;

  //short getter for userData
  Map<String, dynamic>? get userData => _userData;

  //short setter for userData
  set userData(Map<String, dynamic>? value) => _userData = value;

  //short getter for my variable
  Map<String, dynamic>? get currentDocument => _currentDocument;

  //short setter for my variable
  set currentDocument(Map<String, dynamic>? value) => _currentDocument = value;

  void incrementMyVariable() => _myVariable++;
}
