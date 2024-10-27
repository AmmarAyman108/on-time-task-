// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:task_app/features/tasks/data/models/task_model.dart';
import 'package:task_app/features/tasks/data/repositories/task_repo.dart';
import 'package:task_app/features/tasks/presentation/cubit/task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TextEditingController titleController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  final TaskRepo taskRepo;
  TaskCubit({required this.taskRepo}) : super(TaskInitial());

  getToDayDoTasks() {
    var result = taskRepo.getToDayDoTask();
    result.fold(
      (failure) => emit(TaskFailure(errorMessage: failure.errorMessage)),
      (tasks) => emit(GetToDayDoTaskSuccess(tasks: tasks)),
    );
  }

  getDoneTask() {
    var result = taskRepo.getDoneTask();
    result.fold(
      (failure) => emit(TaskFailure(errorMessage: failure.errorMessage)),
      (tasks) => emit(GetDoneTaskSuccess(tasks: tasks)),
    );
  }

  getArchivedTask() {
    var result = taskRepo.getArchivedTask();
    result.fold(
      (failure) => emit(TaskFailure(errorMessage: failure.errorMessage)),
      (tasks) => emit(GetArchivedTaskSuccess(tasks: tasks)),
    );
  }

  addToDoTask({required TaskModel task}) async {
    var result = await taskRepo.addToDayDoTask(task: task);
    result.fold(
      (failure) {
    
        emit(TaskFailure(errorMessage: failure.errorMessage));
      },
      (response) => emit(AddToDayDoSuccess(message: response.message)),
    );
  }

  addToDoneTask({required TaskModel task}) async {
    var result = await taskRepo.addToDoneTask(task: task);
    result.fold(
      (failure) => emit(TaskFailure(errorMessage: failure.errorMessage)),
      (response) => emit(AddToDoneSuccess(message: response.message)),
    );
  }
  addToArchivedTask({required TaskModel task}) async {
    var result = await taskRepo.addToArchivedTask(task: task);
    result.fold(
      (failure) => emit(TaskFailure(errorMessage: failure.errorMessage)),
      (response) => emit(AddToArchivedTaskSuccess(message: response.message)),
    );
  }

  deleteTask({required TaskModel task}) async {
    var result = await taskRepo.deleteTask(task: task);
    result.fold(
      (failure) => emit(TaskFailure(errorMessage: failure.errorMessage)),
      (response) => emit(DeleteTaskSuccess(message: response.message)),
    );
  }
}
