import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/core/widgets/custom_app_bar.dart';
import 'package:task_app/features/tasks/presentation/cubit/task_cubit.dart';
import 'package:task_app/features/tasks/presentation/widgets/done_task_list_builder.dart';

class DoneTaskView extends StatefulWidget {
  const DoneTaskView({super.key});

  @override
  State<DoneTaskView> createState() => _DoneTaskViewState();
}

class _DoneTaskViewState extends State<DoneTaskView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TaskCubit>(context).getDoneTask();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          SliverToBoxAdapter(
            child: CustomAppBar(
              leadingIcon: Icons.playlist_add_check_circle_outlined,
              title: "NewTask",
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          DoneTaskListBuilder()
        ],
      ),
    );
  }
}
