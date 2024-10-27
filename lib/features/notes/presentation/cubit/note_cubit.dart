// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:task_app/features/notes/data/models/note_model.dart';
import 'package:task_app/features/notes/data/repositories/note_repo.dart';
import 'package:task_app/features/notes/presentation/cubit/note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  TextEditingController addNoteTitleController = TextEditingController();
  TextEditingController addNoteContentController = TextEditingController();
  TextEditingController addNoteDataController = TextEditingController();
  TextEditingController editNoteTitleController = TextEditingController();
  TextEditingController editNoteContentController = TextEditingController();
  TextEditingController editNoteDataController = TextEditingController();
  GlobalKey<FormState> addNoteFormKeyController = GlobalKey<FormState>();
  AutovalidateMode addNoteAutovalidateMode = AutovalidateMode.disabled;

  final NoteRepo noteRepo;
  NoteCubit({required this.noteRepo}) : super(NoteInitial());

  Future<void> addNote({required NoteModel note}) async {
    var result = await noteRepo.addNote(note: note);
    result.fold(
      (failure) => emit(NoteFailure(errorMessage: failure.errorMessage)),
      (response) => emit(AddNoteSuccess(message: response.message)),
    );
  }

  Future<void> editNote({
    required NoteModel note,
    String? newTitle,
    String? newContent,
    String? newDate,
  }) async {
    var result = await noteRepo.editNote(
        note: note,
        newContent: newContent,
        newDate: newDate,
        newTitle: newTitle);
    result.fold(
      (failure) => emit(NoteFailure(errorMessage: failure.errorMessage)),
      (response) => emit(EditNoteSuccess(message: response.message)),
    );
  }

  Future<void> deleteNote({required NoteModel note}) async {
    var result = await noteRepo.deleteNote(note: note);
    result.fold(
      (failure) => emit(NoteFailure(errorMessage: failure.errorMessage)),
      (response) => emit(DeleteNoteSuccess(message: response.message)),
    );
  }

  void getAllNotes() {
    var result = noteRepo.getAllNotes();
    result.fold(
      (failure) => emit(NoteFailure(errorMessage: failure.errorMessage)),
      (notes) => emit(GetNoteSuccess(notes: notes)),
    );
  }
}
