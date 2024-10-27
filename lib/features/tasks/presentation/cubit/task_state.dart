import 'package:task_app/features/tasks/data/models/task_model.dart';

abstract class TaskState {}

class TaskInitial extends TaskState {}

class GetToDayDoTaskSuccess extends TaskState {
  final List<TaskModel> tasks;
  GetToDayDoTaskSuccess({required this.tasks});
}

class GetDoneTaskSuccess extends TaskState {
  final List<TaskModel> tasks;
  GetDoneTaskSuccess({required this.tasks});
}

class GetArchivedTaskSuccess extends TaskState {
  final List<TaskModel> tasks;
  GetArchivedTaskSuccess({required this.tasks});
}

class AddToDoneSuccess extends TaskState {
  final String message;
  AddToDoneSuccess({required this.message});
}

class AddToDayDoSuccess extends TaskState {
  final String message;
  AddToDayDoSuccess({required this.message});
}

class AddToArchivedTaskSuccess extends TaskState {
  final String message;
  AddToArchivedTaskSuccess({required this.message});
}

class DeleteTaskSuccess extends TaskState {
  final String message;
  DeleteTaskSuccess({required this.message});
}

class TaskFailure extends TaskState {
  final String errorMessage;
  TaskFailure({required this.errorMessage});
}
