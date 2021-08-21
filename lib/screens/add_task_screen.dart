import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

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
                      onChanged: (_) {},
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Color",
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          ToggleButtons(
                            selectedBorderColor: Colors.black54,
                            borderWidth: 3.0,
                            splashColor: Colors.blue,
                            children: <Widget>[
                              Container(
                                width: 42.0,
                                height: 42.0,
                                color: Color.fromRGBO(218, 198, 162, 1),
                              ),
                              Container(
                                width: 42.0,
                                height: 42.0,
                                color: Color.fromRGBO(196, 122, 112, 1),
                              ),
                              Container(
                                width: 42.0,
                                height: 42.0,
                                color: Color.fromRGBO(162, 182, 218, 1),
                              ),
                              Container(
                                width: 42.0,
                                height: 42.0,
                                color: Color.fromRGBO(168, 161, 215, 1),
                              ),
                              Container(
                                width: 42.0,
                                height: 42.0,
                                color: Color.fromRGBO(163, 112, 194, 1),
                              ),
                            ],
                            onPressed: (int index) {},
                            isSelected: [false, true, false, false, false],
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
                                        horizontal: 25.0, vertical: 15.0),),
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
                                onPressed: () {},
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
