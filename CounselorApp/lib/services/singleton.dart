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

  //short getter for my variable
  int get myVariable => _myVariable;

  //short getter for account type
  String get accountType => _accountType;

  //short setter for my variable
  set myVariable(int value) => _myVariable = value;

  //short setter for account type
  set accountType(String value) => _accountType = value;

  void incrementMyVariable() => _myVariable++;
}
