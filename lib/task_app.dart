import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/config/theme/app_theme.dart';
import 'package:task_app/features/notes/data/data_sources/data_source.dart';
import 'package:task_app/features/notes/data/repositories/note_repo.dart';
import 'package:task_app/features/notes/presentation/cubit/note_cubit.dart';
import 'package:task_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:task_app/features/home/presentation/pages/home_view.dart';
import 'package:task_app/features/tasks/data/data_sources/task_data_sources.dart';
import 'package:task_app/features/tasks/data/repositories/task_repo.dart';
import 'package:task_app/features/tasks/presentation/cubit/task_cubit.dart';

class TaskApp extends StatelessWidget {
  const TaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: SafeArea(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => TaskCubit(
                  taskRepo:
                      TaskRepoImpl(taskDataSource: TaskDataSourcesImpl())),
            ),
            BlocProvider(
                create: (context) => NoteCubit(
                      noteRepo: NoteRepoImpl(
                        noteDataSource: NoteDataSourceImpl(),
                      ),
                    )),
            BlocProvider(
              create: (context) => HomeCubit(),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getTheme,
            home: const HomeView(),
          ),
        ),
      ),
    );
  }
}
