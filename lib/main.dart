import 'package:flutter/material.dart';
import 'loginscreen.dart';
import 'main_view.dart';

main() {

  //runApp(new MyLoginPage());
  runApp(new MainView());
}



// I'm going to put globally used stuff here

// Just something to hold the montserrat font without me having to type new TextStyle(fontfamily: "Montserrat") every damn time
class MyFont {
  static TextStyle montserrat = new TextStyle(fontFamily: "Montserrat");
}

class UserState {
  static bool usertoken = false;
}