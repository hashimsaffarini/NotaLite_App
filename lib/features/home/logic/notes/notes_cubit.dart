import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:to_do/core/helpers/helper_const.dart';
import 'package:to_do/features/home/data/models/note_model.dart';
import 'package:to_do/features/home/ui/widgets/note_item.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel>? notes;
  static final GlobalKey<AnimatedListState> key = GlobalKey();

  fetchAllNotes() async {
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    notes = notesBox.values.toList().reversed.toList();
    emit(NotesSuccess(notes!.reversed.toList()));
  }

  changeFavorite(NoteModel note) async {
    note.isFavorite = !note.isFavorite;
    await note.save();
    fetchAllNotes();
  }

  removeNote(NoteModel note) async {
    emit(NotesLoading());
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    await notesBox.delete(note.key);
    fetchAllNotes();
  }

  deleteNote(NoteModel note, int index) async {
    key.currentState!.removeItem(
      index,
      (context, animation) => SizeTransition(
        sizeFactor: animation,
        child: NoteItem(note: note, index: index),
      ),
      duration: const Duration(milliseconds: 400),
    );
    removeNote(note);
  }
}
