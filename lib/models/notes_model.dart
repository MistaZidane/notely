import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'notes_model.g.dart';
@HiveType(typeId: 0)
class NotesModel {
  @HiveField(0)
  final String id;
   @HiveField(1)
  final String title;
   @HiveField(2)
  final String notes;
   @HiveField(3)
  final DateTime date;
   @HiveField(4)
  final Color color;

  NotesModel(
      {required this.id,
      required this.title,
      required this.notes,
      required this.color,
      required this.date});
}
