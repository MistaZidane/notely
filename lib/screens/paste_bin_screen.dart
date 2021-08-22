import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:notes/models/paste_model.dart';
import '../boxes/boxes.dart';
import '../screens/add_paste_screen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class PasteBinScreen extends StatelessWidget {
  PasteBinScreen({Key? key}) : super(key: key);
  final List<Color> colors = [
    Color.fromRGBO(218, 198, 162, 1),
    Color.fromRGBO(183, 111, 193, 1),
    Color.fromRGBO(163, 112, 194, 1),
    Color.fromRGBO(168, 161, 215, 1),
    Color.fromRGBO(162, 182, 218, 1),
    Color.fromRGBO(194, 163, 112, 1),
    Color.fromRGBO(196, 122, 112, 1),
  ];
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Boxes.getPaste().listenable(),
        builder: (context, Box<PasteModel> items, _) {
          List<int> keys = items.keys.cast<int>().toList();
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
            itemCount: keys.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return InkWell(
                  onTap: () {
                    Get.to(AddPasteScreen());
                  },
                  child: Card(
                    margin: EdgeInsets.all(10.0),
                    elevation: 5.0,
                    shadowColor: Colors.grey,
                    color: Color.fromRGBO(218, 198, 162, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Center(
                              child: Icon(
                                Icons.paste_outlined,
                                size: 50.0,
                              ),
                            ),
                          ),
                          Text(
                            "Paste",
                            style: TextStyle(
                                fontSize: 25.0, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }
              final int key = keys[index - 1];
              final PasteModel? data = items.get(key);
              return InkWell(
                onTap: () {},
                child: Card(
                  margin: EdgeInsets.all(10.0),
                  elevation: 5.0,
                  shadowColor: Colors.grey,
                  color: colors[data!.color],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "13/06/2021",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white70),
                                ),
                                Flexible(
                                  child: Text(
                                    data.text,
                                    style: TextStyle(color: Colors.white70),
                                    softWrap: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        });

    // InkWell(
    //   onTap: () {},
    //   child: Card(
    //     margin: EdgeInsets.all(10.0),
    //     elevation: 5.0,
    //     shadowColor: Colors.grey,
    //     color: Color.fromRGBO(183, 111, 193, 1),
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(18.0),
    //     ),
    //     child: Padding(
    //       padding: const EdgeInsets.all(13.0),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Flexible(
    //             child: Container(
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text(
    //                     "13/06/2021",
    //                     style: TextStyle(
    //                         fontSize: 16.0,
    //                         fontWeight: FontWeight.bold,
    //                         color: Colors.white70),
    //                   ),
    //                   Flexible(
    //                     child: Text(
    //                       "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
    //                       style: TextStyle(color: Colors.white70),
    //                       softWrap: true,
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // ),
    // InkWell(
    //   onTap: () {},
    //   child: Card(
    //     margin: EdgeInsets.all(10.0),
    //     elevation: 5.0,
    //     shadowColor: Colors.grey,
    //     color: Color.fromRGBO(163, 112, 194, 1),
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(18.0),
    //     ),
    //     child: Padding(
    //       padding: const EdgeInsets.all(13.0),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Flexible(
    //             child: Container(
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text(
    //                     "13/06/2021",
    //                     style: TextStyle(
    //                         fontSize: 16.0,
    //                         fontWeight: FontWeight.bold,
    //                         color: Colors.white70),
    //                   ),
    //                   Flexible(
    //                     child: Text(
    //                       "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
    //                       style: TextStyle(color: Colors.white70),
    //                       softWrap: true,
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // ),
    // InkWell(
    //   onTap: () {},
    //   child: Card(
    //     margin: EdgeInsets.all(10.0),
    //     elevation: 5.0,
    //     shadowColor: Colors.grey,
    //     color: Color.fromRGBO(168, 161, 215, 1),
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(18.0),
    //     ),
    //     child: Padding(
    //       padding: const EdgeInsets.all(13.0),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Flexible(
    //             child: Container(
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text(
    //                     "13/06/2021",
    //                     style: TextStyle(
    //                         fontSize: 16.0,
    //                         fontWeight: FontWeight.bold,
    //                         color: Colors.white70),
    //                   ),
    //                   Flexible(
    //                     child: Text(
    //                       "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
    //                       style: TextStyle(color: Colors.white70),
    //                       softWrap: true,
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // ),
    // InkWell(
    //   onTap: () {},
    //   child: Card(
    //     margin: EdgeInsets.all(10.0),
    //     elevation: 5.0,
    //     shadowColor: Colors.grey,
    //     color: Color.fromRGBO(162, 182, 218, 1),
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(18.0),
    //     ),
    //     child: Padding(
    //       padding: const EdgeInsets.all(13.0),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Flexible(
    //             child: Container(
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text(
    //                     "13/06/2021",
    //                     style: TextStyle(
    //                         fontSize: 16.0,
    //                         fontWeight: FontWeight.bold,
    //                         color: Colors.white70),
    //                   ),
    //                   Flexible(
    //                     child: Text(
    //                       "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
    //                       style: TextStyle(color: Colors.white70),
    //                       softWrap: true,
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // ),
  }
}
