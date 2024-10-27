import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/core/widgets/custom_app_bar.dart';
import 'package:task_app/features/notes/presentation/cubit/note_cubit.dart';
import 'package:task_app/features/notes/presentation/widgets/note_list_builder.dart';
import 'package:task_app/features/notes/presentation/widgets/note_view_floating_action_button.dart';

class NoteView extends StatefulWidget {
  const NoteView({
    super.key,
  });

  @override
  State<NoteView> createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NoteCubit>(context).getAllNotes();
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
              leadingIcon: Icons.note_add_outlined,
              title: "Notes",
            ),
          ),
          NoteListBuilder()
        ],
      ),
      floatingActionButton: NoteViewFloatingActionButton(),
    );
  }
}
