import 'package:task_app/features/notes/data/models/note_model.dart';

abstract class NoteState {}

class NoteInitial extends NoteState {}

class NoteFailure extends NoteState {
  final String errorMessage;
  NoteFailure({required this.errorMessage});
}

class GetNoteSuccess extends NoteState {
  final List<NoteModel> notes;
  GetNoteSuccess({required this.notes});
}

class AddNoteSuccess extends NoteState {
  final String message;
  AddNoteSuccess({required this.message});
}

class EditNoteSuccess extends NoteState {
  final String message;
  EditNoteSuccess({required this.message});
}

class DeleteNoteSuccess extends NoteState {
  final String message;
  DeleteNoteSuccess({required this.message});
}
