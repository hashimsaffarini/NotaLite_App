import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/core/theming/styles.dart';
import 'package:to_do/core/utils/app_colors.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dueDateController = TextEditingController();
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
        _dueDateController.text =
            '${pickedDate.day}/${pickedDate.month}/${pickedDate.year}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.0.w),
        child: Column(
          children: [
            TextFormField(
              controller: _titleController,
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
              controller: _descriptionController,
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
              controller: _dueDateController,
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
