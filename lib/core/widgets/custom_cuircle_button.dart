import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do/core/utils/app_colors.dart';

class CustomCircleButton extends StatelessWidget {
  const CustomCircleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: AppColors.primaryColor,
        padding: EdgeInsets.all(22.r),
      ),
      child: SvgPicture.asset(
        'assets/images/ArrowRight.svg',
        height: 16.h,
      ),
    );
  }
}
