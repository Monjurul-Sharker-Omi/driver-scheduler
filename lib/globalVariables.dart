class GlobalVariables {
  static final _globalvariables = GlobalVariables._internal();

  List<String> options = [];

  List<String> licenseNo = [
    "Toyota/97-666",
    "Toyota/122476",
    "Toyota/552738",
    "Toyota/ABC827838"
  ];

  List<String> driver = [
    "Peter Griffin",
    "Stewie Griffin",
    "Glen Quagmire",
    "Ananta Jalil"
  ];


  void addData(String newData){
    options.add(newData);
  }

  void clearData(){
    options.clear();
  }

  factory GlobalVariables(){
    return _globalvariables;
  }
  GlobalVariables._internal();
}

final globalvariables = GlobalVariables();
