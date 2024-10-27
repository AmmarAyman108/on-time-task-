import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_app/core/constants.dart';
import 'package:task_app/core/errors/failure.dart';
import 'package:task_app/features/notes/data/data_sources/data_source.dart';
import 'package:task_app/features/notes/data/models/note_model.dart';
import 'package:task_app/features/notes/data/models/operation_response_model.dart';

abstract class NoteRepo {
  Either<Failure, List<NoteModel>> getAllNotes();
  Future<Either<Failure, OperationResponseModel>> addNote(
      {required NoteModel note});
  Future<Either<Failure, OperationResponseModel>> editNote(
      {required NoteModel note,
      String? newTitle,
      String? newContent,
      String? newDate});
  Future<Either<Failure, OperationResponseModel>> deleteNote(
      {required NoteModel note});
}

class NoteRepoImpl implements NoteRepo {
  final NoteDataSource noteDataSource;
  final Box _box = Hive.box<NoteModel>(Constants.notesBox);

  NoteRepoImpl({required this.noteDataSource});

  @override
  Future<Either<Failure, OperationResponseModel>> addNote(
      {required NoteModel note}) async {
    try {
      await _box.add(note);
      return right(OperationResponseModel(message: "Success to add note"));
    } catch (e) {
      return left(CacheFailure(
          errorMessage: 'Failed to load cached data. Error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, OperationResponseModel>> editNote({
    required NoteModel note,
    String? newTitle,
    String? newContent,
    String? newDate,
  }) async {
    try {
      // Update the fields only if a new value is provided
      if (newTitle != null) {
        note.title = newTitle;
      }
      if (newContent != null) {
        note.content = newContent;
      }
      if (newDate != null) {
        note.date = newDate;
      }

      // Save the updated note to Hive
      await note.save();

      // Return success message on completion
      return right(OperationResponseModel(message: "Note successfully edited"));
    } catch (e) {
      // Return failure with a detailed error message in case of any exception
      return left(CacheFailure(
          errorMessage: 'Failed to edit the note. Error: ${e.toString()}'));
    }
  }

  @override
  Either<Failure, List<NoteModel>> getAllNotes() {
    try {
      List<NoteModel> notes = _box.values.toList() as List<NoteModel>;
      return right(notes.reversed.toList());
    } catch (e) {
      return left(CacheFailure(
          errorMessage: 'Failed to load cached data. Error: ${e.toString()}'));
    }
  }

  @override

  Future<Either<Failure, OperationResponseModel>> deleteNote(
      {required NoteModel note}) async {
    try {
      await note.delete();
      return right(OperationResponseModel(message: "Success to delete note"));
    } catch (e) {
      return left(CacheFailure(
          errorMessage: 'Failed to load cached data. Error: ${e.toString()}'));
    }
  }
}
