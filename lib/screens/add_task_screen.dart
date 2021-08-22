import 'dart:math';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:notes/boxes/boxes.dart';
import 'package:notes/models/task_model.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({Key? key}) : super(key: key);
  // textFieldControllers
  final TextEditingController titleController = TextEditingController();
  Object selectedCategory = '';
  final TextEditingController notesController = TextEditingController();
  final List<Color> colors = [
    Color.fromRGBO(218, 198, 162, 1),
    Color.fromRGBO(183, 111, 193, 1),
    Color.fromRGBO(163, 112, 194, 1),
    Color.fromRGBO(168, 161, 215, 1),
    Color.fromRGBO(162, 182, 218, 1),
    Color.fromRGBO(194, 163, 112, 1),
    Color.fromRGBO(196, 122, 112, 1),
  ];

  void addTask(TaskModel taskItem) async {
    final box = Boxes.getTask();

    box.add(taskItem).then((value) {
      print(value);
      Get.snackbar("Success", "Saved Task",
          snackPosition: SnackPosition.BOTTOM);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromRGBO(228, 224, 239, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(121, 111, 193, 1),
        title: Text(
          "Add Task",
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Date",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.calendar_today_sharp),
                        hintText: "mm/dd/yy",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.black26)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Title",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.title),
                        hintText: "Your title",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.black26)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Category",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.black26),
                        ),
                      ),
                      iconSize: 25.0,
                      icon: Icon(Icons.arrow_drop_down_circle_outlined),
                      items: ["Programming", "Design", "Books"]
                          .map((label) => DropdownMenuItem(
                                child: Text(label),
                                value: label,
                              ))
                          .toList(),
                      onChanged: (value) {
                        selectedCategory = value!;
                        print(selectedCategory.toString());
                      },
                      hint: Text("Category"),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Notes",
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          TextField(
                            controller: notesController,
                            maxLines: 6,
                            decoration: InputDecoration(
                              hintText: "Enter notes here",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide:
                                      BorderSide(color: Colors.black26)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                            child: FractionallySizedBox(
                              widthFactor: 0.6,
                              // width: 130.0,
                              // height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 0.1,
                                  primary: Colors.white54,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 25.0, vertical: 15.0),
                                ),
                                onPressed: () {},
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            child: FractionallySizedBox(
                              widthFactor: 0.9,

                              // width: 240.0,
                              // height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 0.1,
                                  primary: Color.fromRGBO(121, 111, 193, 1),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 25.0, vertical: 15.0),
                                ),
                                onPressed: () {
                                  var randonColor = Random();
                                  addTask(TaskModel(
                                      id: "id",
                                      title: titleController.text,
                                      notes: notesController.text,
                                      category: selectedCategory.toString(),
                                      color: randonColor.nextInt(6),
                                      date: DateTime.now()));
                                },
                                child: Text(
                                  "Save",
                                  style: TextStyle(color: Colors.white60),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
