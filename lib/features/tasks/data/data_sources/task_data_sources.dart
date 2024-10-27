import 'package:hive/hive.dart';
import 'package:task_app/core/constants.dart';
import 'package:task_app/features/tasks/data/models/task_model.dart';

abstract class TaskDataSources {
  List<TaskModel> getToDayDoTask();
  List<TaskModel> getDoneTask();
  List<TaskModel> getArchivedTask();
}

class TaskDataSourcesImpl implements TaskDataSources {
  final taskBox = Hive.box<TaskModel>(Constants.taskBox);

  @override
  List<TaskModel> getArchivedTask() {
    List<TaskModel> tasks = taskBox.values.toList();
    List<TaskModel> archivedTask = [];
    for (var task in tasks) {
      if (task.status == Constants.archivedStatus) {
        archivedTask.add(task);
      }
    }
    return archivedTask.reversed.toList();
  }

  @override
  List<TaskModel> getDoneTask() {
    List<TaskModel> tasks = taskBox.values.toList();
    List<TaskModel> doneTask = [];
    for (var task in tasks) {
      if (task.status == Constants.doneStatus) {
        doneTask.add(task);
      }
    }
    return doneTask.reversed.toList();
  }

  @override
  List<TaskModel> getToDayDoTask() {
    List<TaskModel> tasks = taskBox.values.toList();
    List<TaskModel> toDayDoTask = [];
    for (var task in tasks) {
      if (task.status == Constants.toDayDoStatus) {
        toDayDoTask.add(task);
      }
    }
    return toDayDoTask.reversed.toList();
  }
}
