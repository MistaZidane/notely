import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:notes/screens/home_screen.dart';
// import 'package:notes/screens/add_notes_screen.dart';
// import 'package:notes/screens/home_screen.dart';
// import 'package:notes/screens/add_task_screen.dart';
import 'package:notes/screens/splash_screen.dart';
import 'package:notes/screens/welcome_Screen.dart';
// import 'package:notes/widgets/tasks.dart';
// import 'package:notes/screens/welcome_Screen.dart';
// import './screens/welcome_Screen.dart';
// import 'screens/home_screen.dart';

void main() {
  runApp(GetMaterialApp(
    theme: ThemeData(
      // primaryColor: Color.fromRGBO(121, 111, 193, 1),
      textTheme: TextTheme(
        headline1: TextStyle(
            fontFamily: "Georama",
            fontSize: 38.0,
            color: Colors.white,
            fontWeight: FontWeight.bold),
        headline2: TextStyle(
          fontSize: 20.0,
          color: Colors.white60,
        ),
        bodyText1: TextStyle(fontFamily: "Georama"),
      ),
    ),
    home: WelcomeScreen(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}