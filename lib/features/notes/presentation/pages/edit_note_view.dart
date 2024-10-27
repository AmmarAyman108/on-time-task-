import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:task_app/core/colors.dart';
import 'package:task_app/core/widgets/custom_text_field.dart';
import 'package:task_app/features/notes/data/models/note_model.dart';
import 'package:task_app/features/notes/presentation/cubit/note_cubit.dart';
import 'package:task_app/features/notes/presentation/widgets/done_action_icon.dart';

// ignore: must_be_immutable
class EditNoteView extends StatefulWidget {
  EditNoteView({super.key, required this.oldNote});
  NoteModel oldNote;

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  @override
  void initState() {
    BlocProvider.of<NoteCubit>(context).editNoteTitleController.text =
        widget.oldNote.title;
    BlocProvider.of<NoteCubit>(context).editNoteContentController.text =
        widget.oldNote.content;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final noteCubit = BlocProvider.of<NoteCubit>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.primaryColor,
        elevation: 0,
        centerTitle: true,
        actions: [
          DoneIActionIcon(
            onPressed: () async {
              await noteCubit.editNote(
                  note: widget.oldNote,
                  newContent: noteCubit.editNoteContentController.text,
                  newTitle: noteCubit.editNoteTitleController.text,
                  newDate: DateFormat('d-M-yyyy').format(DateTime.now()));
              noteCubit.getAllNotes();
              // ignore: use_build_context_synchronously
              Navigator.pop(context);
            },
          ),
        ],
        leading: IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: () async {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 30,
          ),
        ),
        title: Text(
          'Edit Note',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25.sp,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 80,
              left: 15,
              right: 15,
            ),
            child: CustomTextField(
              controller: noteCubit.editNoteTitleController,
              hint: 'Title',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 15,
              right: 15,
            ),
            child: CustomTextField(
              controller: noteCubit.editNoteContentController,
              hint: 'Content',
              maxLines: 5,
              circular: 16,
            ),
          ),
        ],
      ),
    );
  }
}
