import 'package:flutter/material.dart';

class NotesDetailsScreen extends StatelessWidget {
  const NotesDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(121, 111, 193, 1),
        title: Text(
          "Note Title",
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      body: Center(
        child: Text("Notes Details Page"),
      ),
    );
  }
}
