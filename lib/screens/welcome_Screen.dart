import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:get/route_manager.dart';
import 'package:notes/screens/home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(121, 111, 193, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 50.0,
                ),
                Container(
                  child: Text(
                    "___",
                    style: TextStyle(color: Colors.white60),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  child: Column(
                    children: [
                      Text(
                        "Hi there,",
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      Text(
                        "I'm Notely",
                        style: Theme.of(context).textTheme.headline1,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Container(
                  child: Column(
                    children: [
                      Text(
                        "I am your new personal:",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      SizedBox(
                        height: 30.0,
                        child: AnimatedTextKit(
                          animatedTexts: [
                            RotateAnimatedText('Note App!',
                                textStyle:
                                    Theme.of(context).textTheme.headline2),
                            RotateAnimatedText('Journal App!',
                                textStyle:
                                    Theme.of(context).textTheme.headline2),
                            RotateAnimatedText('Paste Bin!',
                                textStyle:
                                    Theme.of(context).textTheme.headline2),
                          ],
                          onTap: () {
                            print("Tap Event");
                          },
                          repeatForever: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 50.0,
                ),
                Container(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      padding: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 55.0),
                      backgroundColor: Colors.white70,
                    ),
                    onPressed: () {
                      Get.off(HomeScreen());
                    },
                    child: Text(
                      "HI, NOTELY!",
                      style: TextStyle(color: Color.fromRGBO(121, 111, 193, 1)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  child: TextButton(
                    style: TextButton.styleFrom(),
                    child: Text(
                      "I ALREADY HAVE AN ACCOUNT",
                      style: TextStyle(color: Colors.white60),
                    ),
                    onPressed: () {},
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
