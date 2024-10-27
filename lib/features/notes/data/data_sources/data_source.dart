import 'package:hive_flutter/adapters.dart';
import 'package:task_app/core/constants.dart';
import 'package:task_app/features/notes/data/models/note_model.dart';

abstract class NoteDataSource {
  List<NoteModel> getAllNotes();
}

class NoteDataSourceImpl implements NoteDataSource {
  @override
  List<NoteModel> getAllNotes() {
    return Hive.box<NoteModel>(Constants.notesBox).values.toList();
  }
}
