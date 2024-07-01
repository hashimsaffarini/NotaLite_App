import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/core/theming/styles.dart';
import 'package:to_do/core/utils/app_images.dart';
import 'package:to_do/core/widgets/custom_button.dart';
import 'package:to_do/core/widgets/nav_bar.dart';

class EmptyHomePage extends StatelessWidget {
  const EmptyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          Assets.imagesEmpty2,
          width: 260.sp,
          height: 260.sp,
        ),
        Text(
          'No Recent Notes',
          style: TextStyles.font24BlackRegular.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          'Tap Add New button for navigate to add new task page',
          style: TextStyles.font14BlackRegular,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 26.h),
        CustomButton(
          onPressed: () {
            NavBar.globalKey.currentState!.updateIndex(1);
          },
          buttonText: 'Add New',
          buttonRadius: 48,
          buttonWidth: 170.w,
        ),
      ],
    );
  }
}
