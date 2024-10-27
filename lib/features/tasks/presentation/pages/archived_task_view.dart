import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/core/widgets/custom_app_bar.dart';
import 'package:task_app/features/tasks/presentation/cubit/task_cubit.dart';
import 'package:task_app/features/tasks/presentation/widgets/archived_task_list_builder.dart';

class ArchivedTaskView extends StatefulWidget {
  const ArchivedTaskView({super.key});

  @override
  State<ArchivedTaskView> createState() => _ArchivedTaskViewState();
}

class _ArchivedTaskViewState extends State<ArchivedTaskView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TaskCubit>(context).getArchivedTask();
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
              leadingIcon: Icons.archive_outlined,
              title: "ArchivedTask",
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          ArchivedTaskListBuilder()
        ],
      ),
    );
  }
}
