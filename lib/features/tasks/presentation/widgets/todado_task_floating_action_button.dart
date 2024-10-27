import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/core/colors.dart';
import 'package:task_app/features/tasks/presentation/cubit/task_cubit.dart';

class CustomFloatingActionButton extends StatefulWidget {
  final void Function()? onPressed;
  const CustomFloatingActionButton({super.key, this.onPressed});

  @override
  State<CustomFloatingActionButton> createState() =>
      _CustomFloatingActionButtonState();
}

class _CustomFloatingActionButtonState
    extends State<CustomFloatingActionButton> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TaskCubit>(context).getToDayDoTasks();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5000)),
      onPressed: widget.onPressed,
      backgroundColor: ColorsManager.darkBlueColor,
      child: const Icon(
        Icons.add,
        color: ColorsManager.whiteColor,
      ),
    );
  }
}
