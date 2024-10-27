import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/core/widgets/sliver_error_widget.dart';
import 'package:task_app/core/widgets/sliver_indicator.dart';
import 'package:task_app/features/notes/presentation/cubit/note_cubit.dart';
import 'package:task_app/features/notes/presentation/cubit/note_state.dart';
import 'package:task_app/features/notes/presentation/pages/edit_note_view.dart';
import 'package:task_app/features/notes/presentation/widgets/note_widget.dart';

class NoteListBuilder extends StatelessWidget {
  const NoteListBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit, NoteState>(
      builder: (context, state) {
        if (state is GetNoteSuccess) {
          return SliverList.builder(
            itemCount: state.notes.length,
            itemBuilder: (context, index) => NoteWidget(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EditNoteView(
                  oldNote: state.notes[index],
                ),
              )),
              note: state.notes[index],
            ),
          );
        } else if (state is NoteFailure) {
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
