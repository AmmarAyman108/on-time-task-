import 'package:hive/hive.dart';
part 'task_model.g.dart';

@HiveType(typeId: 1)
class TaskModel extends HiveObject {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String time;

  @HiveField(2)
  final String date;

  @HiveField(3)
   String status;

  TaskModel({
    required this.title,
    required this.time,
    required this.date,
    required this.status,
  });
}
