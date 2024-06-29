import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:to_do/core/theming/styles.dart';
import 'package:to_do/core/utils/app_colors.dart';
import 'package:to_do/features/home/data/models/note_model.dart';
import 'package:to_do/features/home/logic/notes/notes_cubit.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note, required this.index});
  final NoteModel note;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.9,
        ),
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${note.title} \n',
                style: TextStyles.font14BlackRegular.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: AppColors.textColor,
                ),
              ),
              Text(
                note.date,
                style: TextStyles.font14BlackRegular,
              ),
              Row(
                children: [
                  Text(
                    note.time,
                    style: TextStyles.font14BlackRegular,
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      context.read<NotesCubit>().changeFavorite(note);
                    },
                    child: Icon(
                      note.isFavorite ? Icons.favorite : Icons.favorite_border,
                      size: 22,
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  InkWell(
                    onTap: () {
                      final index =
                          context.read<NotesCubit>().notes!.indexOf(note);
                      context.read<NotesCubit>().deleteNote(note, index);
                    },
                    child: const Icon(
                      Iconsax.trash,
                      size: 22,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
