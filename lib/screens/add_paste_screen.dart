import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clipboard/clipboard.dart';

class AddPasteScreen extends StatelessWidget {
  AddPasteScreen({Key? key}) : super(key: key);
  final TextEditingController textfieldontroller = TextEditingController();
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
