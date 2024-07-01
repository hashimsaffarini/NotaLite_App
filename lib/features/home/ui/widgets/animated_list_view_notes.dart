import 'package:flutter/material.dart';
import 'package:to_do/features/home/data/models/note_model.dart';
import 'package:to_do/features/home/logic/notes/notes_cubit.dart';
import 'package:to_do/features/home/ui/widgets/note_item.dart';

class AnimatedListViewNotes extends StatelessWidget {
  const AnimatedListViewNotes({
    super.key,
    required this.notes,
  });

  final List<NoteModel>? notes;

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: NotesCubit.key,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      initialItemCount: notes?.length ?? 0,
      itemBuilder: (context, index, animation) {
        return SizeTransition(
          sizeFactor: animation,
          child: NoteItem(
            note: notes![index],
            index: index,
          ),
        );
      },
    );
  }
}
