import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/models/notes_model.dart';

class Boxes {
  static Box<NotesModel> getNotes() => Hive.box<NotesModel>("notes");
}
