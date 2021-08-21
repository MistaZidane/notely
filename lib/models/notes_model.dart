import 'package:flutter/material.dart';

class NotesModel {
  final String id;
  final String title;
  final String notes;
  final DateTime date;
  final Color color;

  NotesModel(
      {required this.id,
      required this.title,
      required this.notes,
      required this.color,
      required this.date});
}
