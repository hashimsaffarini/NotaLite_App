import 'package:hive/hive.dart';
part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String description;

  @HiveField(2)
  final String date;

  @HiveField(3)
  final String time;

  @HiveField(4)
  int color;

  @HiveField(5)
  String dueDate;

  @HiveField(6)
  bool isFavorite;

  NoteModel({
    required this.title,
    required this.description,
    required this.color,
    required this.dueDate,
    required this.date,
    required this.time,
    this.isFavorite = false,
  });
}
