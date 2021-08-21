import 'package:flutter/material.dart';

class TaskModel {
  final String id;
  final String title;
  final String notes;
  final DateTime date;
  final DateTime startDate;
  final DateTime endDate;
  final Color color;

  TaskModel(
      {required this.id,
      required this.title,
      required this.notes,
      required this.endDate,
      required this.color,
      required this.startDate,
      required this.date});
}
