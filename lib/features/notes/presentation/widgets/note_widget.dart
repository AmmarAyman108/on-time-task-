import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/core/colors.dart';
import 'package:task_app/core/widgets/custom_dismissible_widget.dart';
import 'package:task_app/features/notes/data/models/note_model.dart';
import 'package:task_app/features/notes/presentation/cubit/note_cubit.dart';

class NoteWidget extends StatelessWidget {
  final void Function()? onTap;
  final NoteModel note;
  const NoteWidget({
    super.key,
    this.onTap,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomDismissibleWidget(
        onDismissed: (direction) async {
          await BlocProvider.of<NoteCubit>(context).deleteNote(note: note);
          // ignore: use_build_context_synchronously
          BlocProvider.of<NoteCubit>(context).getAllNotes();
        },
        child: Card(
          color: ColorsManager.noteColorBackground,
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 15, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  note.title,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  note.content,
                  style: TextStyle(
                    fontSize: 11.5.sp,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Spacer(),
                    Text(
                      note.date,
                      style: TextStyle(
                        fontSize: 10.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
