import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/core/theming/styles.dart';
import 'package:to_do/core/utils/app_colors.dart';
import 'package:to_do/features/add/logic/add_note/add_note_cubit.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  Future<void> _selectDueDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColors.primaryColor,
            colorScheme: const ColorScheme.light(
              primary: AppColors.primaryColor,
            ),
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );
    if (pickedDate != null) {
      setState(() {
        context.read<AddNoteCubit>().dueDateController.text =
            '${pickedDate.day}/${pickedDate.month}/${pickedDate.year}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<AddNoteCubit>().formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.0.w),
        child: Column(
          children: [
            TextFormField(
              controller: context.read<AddNoteCubit>().titleController,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a Title';
                }
                return null;
              },
              style: TextStyles.font14BlackRegular.copyWith(
                color: Colors.black,
                fontSize: 16.sp,
              ),
              maxLines: null,
              cursorColor: AppColors.primaryColor,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide(
                    color: AppColors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide(
                    color: AppColors.primaryColor,
                  ),
                ),
                labelText: 'Title',
                labelStyle: TextStyle(
                  color: AppColors.grey,
                ),
              ),
            ),
            SizedBox(height: 16.0.h),
            TextFormField(
              controller: context.read<AddNoteCubit>().descriptionController,
              cursorColor: AppColors.primaryColor,
              style: TextStyles.font14BlackRegular.copyWith(
                color: Colors.black,
                fontSize: 16.sp,
              ),
              maxLines: 5,
              decoration: const InputDecoration(
                alignLabelWithHint: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide(
                    color: AppColors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide(
                    color: AppColors.primaryColor,
                  ),
                ),
                labelText: 'Description (Optional)',
                labelStyle: TextStyle(
                  color: AppColors.grey,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            TextFormField(
              controller: context.read<AddNoteCubit>().dueDateController,
              cursorColor: AppColors.primaryColor,
              readOnly: true,
              onTap: () => _selectDueDate(context),
              style: TextStyles.font14BlackRegular.copyWith(
                color: Colors.black,
                fontSize: 16.sp,
              ),
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide(
                    color: AppColors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide(
                    color: AppColors.primaryColor,
                  ),
                ),
                labelText: 'Due Date (Optional)',
                suffixIcon: Icon(Icons.calendar_today),
                labelStyle: TextStyle(
                  color: AppColors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
