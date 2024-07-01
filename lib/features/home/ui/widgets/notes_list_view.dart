import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/features/home/logic/notes/notes_cubit.dart';
import 'package:to_do/features/home/ui/widgets/animated_list_view_notes.dart';
import 'package:to_do/features/home/ui/widgets/empty_home_page.dart';

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
        if (notes == null || notes.isEmpty) {
          return const EmptyHomePage();
        } else {
          return AnimatedListViewNotes(notes: notes);
        }
      },
    );
  }
}
