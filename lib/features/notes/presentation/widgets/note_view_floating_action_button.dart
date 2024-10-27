import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:task_app/core/extension_build_context.dart';
import 'package:task_app/core/widgets/custom_bottom.dart';
import 'package:task_app/core/widgets/custom_text_field.dart';
import 'package:task_app/features/notes/data/models/note_model.dart';
import 'package:task_app/features/notes/presentation/cubit/note_cubit.dart';
import 'package:task_app/features/tasks/presentation/widgets/todado_task_floating_action_button.dart';

class NoteViewFloatingActionButton extends StatefulWidget {
  const NoteViewFloatingActionButton({
    super.key,
  });

  @override
  State<NoteViewFloatingActionButton> createState() =>
      _NoteViewFloatingActionButtonState();
}

class _NoteViewFloatingActionButtonState
    extends State<NoteViewFloatingActionButton> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return CustomFloatingActionButton(onPressed: () {
      showNoteTaskBottomSheet(context);
    });
  }

  showNoteTaskBottomSheet(BuildContext context) {
    final noteCubit = BlocProvider.of<NoteCubit>(context);

    context.showBottomSheet(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 20),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextField(
                  controller: noteCubit.addNoteTitleController,
                  autovalidateMode: autovalidateMode,
                  hint: 'Title',
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  controller: noteCubit.addNoteContentController,
                  autovalidateMode: autovalidateMode,
                  hint: 'Content',
                  maxLines: 5,
                  circular: 16,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomBottom(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      await noteCubit.addNote(
                          note: NoteModel(
                              title: noteCubit.addNoteTitleController.text,
                              content: noteCubit.addNoteContentController.text,
                              date:
                                  DateFormat('d-M-yyyy').format(DateTime.now())));
                      noteCubit.getAllNotes();
                      // ignore: use_build_context_synchronously
                      Navigator.pop(context);
                      noteCubit.addNoteContentController.clear();
                      noteCubit.addNoteTitleController.clear();
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                    setState(() {
                      autovalidateMode = AutovalidateMode.disabled;
                    });
                  },
                  child: const Text('Add Note'),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
