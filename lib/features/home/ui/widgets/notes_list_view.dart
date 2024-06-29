import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/features/home/logic/notes/notes_cubit.dart';
import 'package:to_do/features/home/ui/widgets/note_item.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({super.key});

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        final notes = context.read<NotesCubit>().notes;
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
      },
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:to_do/features/home/logic/notes/notes_cubit.dart';
// import 'package:to_do/features/home/ui/widgets/note_item.dart';

// class NotesListView extends StatelessWidget {
//   const NotesListView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<NotesCubit, NotesState>(
//       builder: (context, state) {
//         final notes = context.read<NotesCubit>().notes;
//         return ListView.builder(
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           itemCount: notes?.length ?? 0,
//           itemBuilder: (context, index) {
//             return Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
//               child: NoteItem(
//                 note: notes![index],
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }

