// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_app/core/constants.dart';

import 'package:task_app/core/errors/failure.dart';
import 'package:task_app/features/notes/data/models/operation_response_model.dart';
import 'package:task_app/features/tasks/data/data_sources/task_data_sources.dart';
import 'package:task_app/features/tasks/data/models/task_model.dart';

abstract class TaskRepo {
  Either<Failure, List<TaskModel>> getToDayDoTask();
  Either<Failure, List<TaskModel>> getDoneTask();
  Either<Failure, List<TaskModel>> getArchivedTask();
  Future<Either<Failure, OperationResponseModel>> addToArchivedTask(
      {required TaskModel task});
  Future<Either<Failure, OperationResponseModel>> addToDoneTask(
      {required TaskModel task});
  Future<Either<Failure, OperationResponseModel>> addToDayDoTask(
      {required TaskModel task});
  Future<Either<Failure, OperationResponseModel>> deleteTask(
      {required TaskModel task});
}

class TaskRepoImpl implements TaskRepo {
  final TaskDataSources taskDataSource;
  final taskBox = Hive.box<TaskModel>(Constants.taskBox);

  TaskRepoImpl({required this.taskDataSource});
  @override
  Future<Either<Failure, OperationResponseModel>> addToDayDoTask(
      {required TaskModel task}) async {
    try {
      await taskBox.add(task);
      return right(
          OperationResponseModel(message: "Success to add in to day do task"));
    } catch (e) {
      return left(CacheFailure(
          errorMessage: 'Failed to load cached data. Error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, OperationResponseModel>> addToArchivedTask(
      {required TaskModel task}) async {
    try {
      task.status = Constants.archivedStatus;
      await task.save();
      return right(
          OperationResponseModel(message: "Success to add in archived task"));
    } catch (e) {
      return left(CacheFailure(
          errorMessage: 'Failed to load cached data. Error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, OperationResponseModel>> addToDoneTask(
      {required TaskModel task}) async {
    try {
      task.status = Constants.doneStatus;
      await task.save();
      return right(
          OperationResponseModel(message: "Success to add in done task"));
    } catch (e) {
      return left(CacheFailure(
          errorMessage: 'Failed to load cached data. Error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, OperationResponseModel>> deleteTask(
      {required TaskModel task}) async {
    try {
      await task.delete();
      return right(OperationResponseModel(message: "Success to delete task"));
    } catch (e) {
      return left(CacheFailure(
          errorMessage: 'Failed to load cached data. Error: ${e.toString()}'));
    }
  }

  @override
  Either<Failure, List<TaskModel>> getArchivedTask() {
    try {
      List<TaskModel> archivedTask = taskDataSource.getArchivedTask();
      return right(archivedTask);
    } catch (e) {
      return left(CacheFailure(
          errorMessage: 'Failed to load cached data. Error: ${e.toString()}'));
    }
  }

  @override
  Either<Failure, List<TaskModel>> getDoneTask() {
    try {
      List<TaskModel> doneTask = taskDataSource.getDoneTask();
      return right(doneTask);
    } catch (e) {
      return left(CacheFailure(
          errorMessage: 'Failed to load cached data. Error: ${e.toString()}'));
    }
  }

  @override
  Either<Failure, List<TaskModel>> getToDayDoTask() {
    try {
      List<TaskModel> toDayDoTask = taskDataSource.getToDayDoTask();
      return right(toDayDoTask);
    } catch (e) {
      return left(CacheFailure(
          errorMessage: 'Failed to load cached data. Error: ${e.toString()}'));
    }
  }
}
