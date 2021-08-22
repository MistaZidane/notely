import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/models/notes_model.dart';
import 'package:notes/models/paste_model.dart';

class Boxes {
  static Box<NotesModel> getNotes() => Hive.box<NotesModel>("notes");
  static Box<PasteModel> getPaste() => Hive.box<PasteModel>("paste");
}
