import 'package:flutter/material.dart';
import 'package:notes/boxes/boxes.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/models/task_model.dart';

class Tasks extends StatelessWidget {
  Tasks({Key? key}) : super(key: key);
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
        valueListenable: Boxes.getTask().listenable(),
        builder: (context, Box<TaskModel> items, _) {
          List<int> keys = items.keys.cast<int>().toList();
          return ListView.builder(
              itemCount: keys.length,
              itemBuilder: (context, index) {
                final int key = keys[index];
                final TaskModel? data = items.get(key);
                print(data);
                return InkWell(
                  onTap: () {
                    print("object");
                  },
                  child: Card(
                    margin: EdgeInsets.all(10.0),
                    elevation: 3.0,
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
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "9:00 AM",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white70),
                                ),
                                Text(
                                  data.title,
                                  style: TextStyle(color: Colors.white70),
                                )
                              ],
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.check_circle,
                                  color: Colors.white70))
                        ],
                      ),
                    ),
                  ),
                );
              });
        });
  }
}
