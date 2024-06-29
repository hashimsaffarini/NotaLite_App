import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:to_do/core/utils/app_images.dart';
import 'package:to_do/core/widgets/custom_button.dart';
import 'package:to_do/core/widgets/succsess_dialog.dart';
import 'package:to_do/features/add/ui/widgets/add_note_form.dart';
import 'package:to_do/features/add/ui/widgets/colors_filtered.dart';
import 'package:to_do/features/home/data/models/note_model.dart';
import 'package:to_do/features/add/logic/add_note/add_note_cubit.dart';

class AddPageBody extends StatelessWidget {
  const AddPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddNoteCubit, AddNoteState>(
      listener: (context, state) {
        if (state is AddNoteSuccess) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const SuccessDialog();
            },
          );
        } else if (state is AddNoteFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to add note: ${state.message}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: Column(
        children: [
          Center(
            child: Image.asset(
              Assets.imagesAddNote,
              width: 250.sp,
              height: 250.sp,
            ),
          ),
          SizedBox(height: 20.h),
          const AddNoteForm(),
          SizedBox(height: 20.h),
          const ColorsFiltered(),
          SizedBox(height: 20.h),
          CustomButton(
            onPressed: () {
              sendNoteToAdd(context);
            },
            buttonRadius: 48,
            buttonText: 'Add Note',
            verticalPadding: 16,
            horizontalPadding: 16,
          ),
        ],
      ),
    );
  }

  void sendNoteToAdd(BuildContext context) {
    if (context.read<AddNoteCubit>().formKey.currentState!.validate()) {
      final title = context.read<AddNoteCubit>().titleController.text;
      final description =
          context.read<AddNoteCubit>().descriptionController.text;
      final dueDate = context.read<AddNoteCubit>().dueDateController.text;
      final note = NoteModel(
        title: title,
        description: description,
        dueDate: dueDate,
        color: context.read<AddNoteCubit>().color.value,
        date:
            'Date: ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
        time: 'Time: ${DateFormat('hh:mm a').format(DateTime.now())}',
      );
      context.read<AddNoteCubit>().addNote(note);
    }
  }
}
