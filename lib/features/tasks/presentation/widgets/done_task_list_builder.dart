import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/core/widgets/sliver_error_widget.dart';
import 'package:task_app/core/widgets/sliver_indicator.dart';
import 'package:task_app/features/tasks/presentation/widgets/task_widget.dart';
import 'package:task_app/features/tasks/presentation/cubit/task_cubit.dart';
import 'package:task_app/features/tasks/presentation/cubit/task_state.dart';

class DoneTaskListBuilder extends StatelessWidget {
  const DoneTaskListBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final taskCubit = BlocProvider.of<TaskCubit>(context);
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        if (state is GetDoneTaskSuccess) {
          return SliverList.builder(
            itemCount: state.tasks.length,
            itemBuilder: (context, index) => TaskWidget(
              onDismissed: (p0) async {
                await taskCubit.deleteTask(task: state.tasks[index]);
                taskCubit.getDoneTask();
              },
              taskModel: state.tasks[index],
            ),
          );
        } else if (state is TaskFailure) {
          return SliverErrorWidget(
            errorMessage: state.errorMessage,
          );
        } else {
          return const SliverIndicator();
        }
      },
    );
  }
}
