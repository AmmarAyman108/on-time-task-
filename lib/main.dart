import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_app/core/colors.dart';
import 'package:task_app/core/constants.dart';
import 'package:task_app/core/observer.dart';
import 'package:task_app/features/notes/data/models/note_model.dart';
import 'package:task_app/features/tasks/data/models/task_model.dart';
import 'package:task_app/task_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<NoteModel>(Constants.notesBox);
  await Hive.openBox<TaskModel>(Constants.taskBox);
  Bloc.observer = MyBlocObserver();

  setSystemUIOverlayStyle();
  runApp(const TaskApp());
}

void setSystemUIOverlayStyle() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: ColorsManager.primaryColor,
      systemNavigationBarColor: ColorsManager.darkBlueColor,
      statusBarBrightness: Brightness.dark));
}





/*
// flutter_icons:
//   image_path: "icon/icon.png" 
//   android: true
//   ios: true


//   flutter_launcher_icons:
//   android: "launcher_icon"
//   ios: true
//   image_path: "assets/icon/icon.png"
//   min_sdk_android: 21 # android min sdk min:16, default 21
// */