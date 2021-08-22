import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clipboard/clipboard.dart';
import 'package:notes/boxes/boxes.dart';
import '../models/paste_model.dart';

class AddPasteScreen extends StatelessWidget {
  AddPasteScreen({Key? key}) : super(key: key);
  final TextEditingController textfieldontroller = TextEditingController();
  final List<Color> colors = [
    Color.fromRGBO(218, 198, 162, 1),
    Color.fromRGBO(183, 111, 193, 1),
    Color.fromRGBO(163, 112, 194, 1),
    Color.fromRGBO(168, 161, 215, 1),
    Color.fromRGBO(162, 182, 218, 1),
    Color.fromRGBO(194, 163, 112, 1),
    Color.fromRGBO(196, 122, 112, 1),
  ];

  void addPaste(PasteModel pasteItem) async {
    final box = Boxes.getPaste();

    box.add(pasteItem).then((value) {
      print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromRGBO(228, 224, 239, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(121, 111, 193, 1),
        title: Text(
          "Paste",
          style: Theme.of(context).textTheme.headline2,
        ),
        actions: [
          IconButton(
            onPressed: () {
              FlutterClipboard.paste().then((value) {
                textfieldontroller.text = value;
                Get.snackbar("Success", "Pasted from Cliboard",
                    snackPosition: SnackPosition.BOTTOM);
              });
            },
            icon: Icon(Icons.paste_outlined),
          ),
          IconButton(
            onPressed: () {
              FlutterClipboard.copy(textfieldontroller.text).then((value) {
                Get.snackbar("Success", "Copied to Cliboard",
                    snackPosition: SnackPosition.BOTTOM);
              });
            },
            icon: Icon(Icons.copy_outlined),
          ),
          IconButton(
            onPressed: () {
              var randomColorIndex = Random();
              addPaste(PasteModel(
                  color: randomColorIndex.nextInt(6),
                  id: "id",
                  date: DateTime.now(),
                  text: textfieldontroller.text));
              Get.snackbar("Success", "Saved ",
                  snackPosition: SnackPosition.BOTTOM);
            },
            icon: Icon(Icons.save_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            controller: textfieldontroller,
                            toolbarOptions: ToolbarOptions(
                                copy: true,
                                paste: true,
                                cut: true,
                                selectAll: true),
                            maxLines: 100,
                            decoration: InputDecoration(
                              hintText: "Paste here",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(0.0),
                                  borderSide:
                                      BorderSide(color: Colors.black26)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(
                    //   height: 20.0,
                    // ),
                    // Container(
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //     children: [
                    //       SizedBox(
                    //         width: 130.0,
                    //         height: 50,
                    //         child: ElevatedButton(
                    //           style: ElevatedButton.styleFrom(
                    //               elevation: 0.1,
                    //               primary: Colors.white54,
                    //               padding: EdgeInsets.symmetric(
                    //                   horizontal: 25.0, vertical: 15.0)),
                    //           onPressed: () {},
                    //           child: Text(
                    //             "Cancel",
                    //             style: TextStyle(color: Colors.black),
                    //           ),
                    //         ),
                    //       ),
                    //       SizedBox(
                    //         width: 240.0,
                    //         height: 50,
                    //         child: ElevatedButton(
                    //           style: ElevatedButton.styleFrom(
                    //             elevation: 0.1,
                    //             primary: Color.fromRGBO(121, 111, 193, 1),
                    //           ),
                    //           onPressed: () {},
                    //           child: Text(
                    //             "Save",
                    //             style: TextStyle(color: Colors.white60),
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
