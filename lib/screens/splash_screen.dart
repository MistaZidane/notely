import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:notes/screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const colorizeColors = [
      Colors.white70,
      Color.fromRGBO(218, 198, 162, 1),
    ];
    const colorizeTextStyle = TextStyle(
        fontFamily: "Georama",
        fontSize: 38.0,
        color: Colors.white,
        fontWeight: FontWeight.bold);

    return Scaffold(
      backgroundColor: Color.fromRGBO(121, 111, 193, 1),
      body: Center(
          // child: SizedBox(
          //   width: 250.0,
          //   child: TextLiquidFill(
          //     text: 'Notely',
          //     waveColor: Colors.white70,
          //     boxBackgroundColor: Color.fromRGBO(121, 111, 193, 1),
          //     textStyle: TextStyle(
          //         fontFamily: "Georama",
          //         fontSize: 38.0,
          //         color: Colors.white,
          //         fontWeight: FontWeight.bold),
          //     boxHeight: 300.0,
          //     loadDuration: Duration(seconds: 3),
          //   ),
          // ),

          child: SizedBox(
        width: 250.0,
        child: AnimatedTextKit(
          animatedTexts: [
            ColorizeAnimatedText(
              'Notely',
              textAlign: TextAlign.center,
              textStyle: colorizeTextStyle,
              colors: colorizeColors,
            ),
          ],
          // isRepeatingAnimation: true,
          onFinished: () {
            Get.off(HomeScreen());
          },
        ),
      )),
    );
  }
}
