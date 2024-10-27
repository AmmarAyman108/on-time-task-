// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:task_app/features/notes/presentation/pages/note_view.dart';
import 'package:task_app/features/tasks/presentation/pages/archived_task_view.dart';
import 'package:task_app/features/tasks/presentation/pages/done_task_view.dart';
import 'package:task_app/features/tasks/presentation/pages/todaydo_task_view.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  int currentIndex = 0;
  final List<Widget> screens = [
    const NewTaskBody(),
    const DoneTaskView(),
    const ArchivedTaskView(),
    const NoteView()
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(ChangeHomeBottomNavBar());
  }
}
