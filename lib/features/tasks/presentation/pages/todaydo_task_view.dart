// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:task_app/core/constants.dart';
import 'package:task_app/core/extension_build_context.dart';
import 'package:task_app/core/widgets/custom_app_bar.dart';
import 'package:task_app/core/widgets/custom_bottom.dart';
import 'package:task_app/core/widgets/custom_text_field.dart';
import 'package:task_app/features/tasks/data/models/task_model.dart';
import 'package:task_app/features/tasks/presentation/cubit/task_cubit.dart';
import 'package:task_app/features/tasks/presentation/widgets/todado_task_floating_action_button.dart';
import 'package:task_app/features/tasks/presentation/widgets/todaydo_task_list_builder.dart';

class NewTaskBody extends StatefulWidget {
  const NewTaskBody({
    super.key,
  });

  @override
  State<NewTaskBody> createState() => _NewTaskBodyState();
}

class _NewTaskBodyState extends State<NewTaskBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidationMode = AutovalidateMode.disabled;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TaskCubit>(context).getToDayDoTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          SliverToBoxAdapter(
            child: CustomAppBar(
              leadingIcon: Icons.playlist_add_check,
              title: "ToDayDo",
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          TodayDoTaskListBuilder()
        ],
      ),
      floatingActionButton: CustomFloatingActionButton(
        onPressed: () {
          showNewTaskBottomSheet(context);
        },
      ),
    );
  }

  showNewTaskBottomSheet(BuildContext context) {
    final TaskCubit taskCubit = BlocProvider.of<TaskCubit>(context);
    context.showBottomSheet(
        child: Padding(
      padding: EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 20),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                controller: taskCubit.titleController,
                hint: 'Title',
              ),
              const SizedBox(height: 15),
              CustomTextField(
                keyboardType: TextInputType.none,
                controller: taskCubit.timeController,
                onTap: () {
                  showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  ).then((selectedTime) {
                    if (selectedTime != null) {
                      // Convert TimeOfDay to the desired format
                      final now = DateTime.now();
                      final time = DateTime(now.year, now.month, now.day,
                          selectedTime.hour, selectedTime.minute);
                      final formattedTime = DateFormat('HH:mm').format(time);
                      taskCubit.timeController.text = formattedTime;
                    }
                  }).catchError((error) {});
                },
                hint: 'Time',
              ),
              const SizedBox(height: 15),
              CustomTextField(
                controller: taskCubit.dateController,
                onTap: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  ).then((selectedDate) {
                    if (selectedDate != null) {
                      final formattedDate =
                          DateFormat('d-M-yyyy').format(selectedDate);

                      taskCubit.dateController.text = formattedDate;
                    }
                  }).catchError((error) {});
                },
                hint: 'Date',
                keyboardType: TextInputType.none,
              ),
              const SizedBox(height: 20),
              CustomBottom(
                child: const Text('Add Task'),
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    await taskCubit.addToDoTask(
                        task: TaskModel(
                            title: taskCubit.titleController.text,
                            time: taskCubit.timeController.text,
                            date: taskCubit.dateController.text,
                            status: Constants.toDayDoStatus));
                    taskCubit.getToDayDoTasks();
                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);
                    taskCubit.titleController.clear();
                    taskCubit.timeController.clear();
                    taskCubit.dateController.clear();
                  } else {
                    setState(() {
                      autoValidationMode = AutovalidateMode.always;
                    });
                  }
                },
              )
            ],
          ),
        ),
      ),
    ));
  }
}
