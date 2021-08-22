import 'package:hive/hive.dart';
part 'task_model.g.dart';

@HiveType(typeId: 2)
class TaskModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String notes;
  @HiveField(3)
  final DateTime date;
  // @HiveField(4)
  // final DateTime startDate;
  // @HiveField(5)
  // final DateTime endDate;
  @HiveField(4)
  final int color;
  @HiveField(5)
  final String category;

  TaskModel(
      {required this.id,
      required this.title,
      required this.notes,
      required this.category,
      required this.color,
      required this.date});
}
