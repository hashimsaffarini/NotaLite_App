import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/core/utils/app_images.dart';
import 'package:to_do/features/add/ui/widgets/add_note_form.dart';
import 'package:to_do/features/add/ui/widgets/colors_filtered.dart';

class AddPageBody extends StatelessWidget {
  const AddPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Image.asset(
            Assets.imagesAddNote,
            width: 270.sp,
            height: 270.sp,
          ),
        ),
        SizedBox(height: 20.h),
        const AddNoteForm(),
        SizedBox(height: 20.h),
        const ColorsFiltered(),
      ],
    );
  }
}
