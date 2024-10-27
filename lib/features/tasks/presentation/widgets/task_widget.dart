import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/core/colors.dart';
import 'package:task_app/core/constants.dart';
import 'package:task_app/features/tasks/data/models/task_model.dart';
import 'package:task_app/core/widgets/custom_dismissible_widget.dart';
import 'package:task_app/features/tasks/presentation/cubit/task_cubit.dart';

// ignore: must_be_immutable
class TaskWidget extends StatelessWidget {
  final TaskModel taskModel;
  Function(DismissDirection)? onDismissed;
  TaskWidget({super.key, required this.taskModel, this.onDismissed});

  @override
  Widget build(BuildContext context) {
    final taskCubit = BlocProvider.of<TaskCubit>(context);
    return CustomDismissibleWidget(
      onDismissed: onDismissed,
      child: Card(
        color: ColorsManager.noteColorBackground,
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 15, vertical: 15),
          child: Row(
            children: [
              CircleAvatar(
                radius: 21.w,
                backgroundColor: ColorsManager.whiteColor,
                child: CircleAvatar(
                  radius: 20.w,
                  backgroundColor: ColorsManager.primaryColor,
                  child: Text(
                    taskModel.time,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: ColorsManager.whiteColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                taskModel.title,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Spacer(),
              Column(
                children: [
                  taskModel.status == Constants.toDayDoStatus
                      ? Row(
                          children: [
                            IconButton(
                                onPressed: () async {
                                  await taskCubit.addToDoneTask(
                                      task: taskModel);
                                  taskCubit.getToDayDoTasks();
                                  // taskCubit.getDoneTask();
                                },
                                icon: Icon(
                                  Icons.playlist_add_check_circle_outlined,
                                  color: ColorsManager.darkGreenColor,
                                  size: 25.r,
                                )),
                            IconButton(
                                onPressed: () async {
                                  await taskCubit.addToArchivedTask(
                                      task: taskModel);
                                  taskCubit.getToDayDoTasks();
                                  // taskCubit.getArchivedTask();
                                },
                                icon: Icon(
                                  Icons.archive_outlined,
                                  color: ColorsManager.whiteBlueColor,
                                  size: 25.r,
                                )),
                          ],
                        )
                      : const SizedBox(),
                  Text(
                    taskModel.date,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 10.sp,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
