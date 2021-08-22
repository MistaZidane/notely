import 'package:hive/hive.dart';
part 'paste_model.g.dart';

@HiveType(typeId: 1)
class PasteModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String text;
  @HiveField(2)
  final DateTime date;
  @HiveField(3)
  final int color;
  PasteModel(
      {required this.color,
      required this.id,
      required this.date,
      required this.text});
}
