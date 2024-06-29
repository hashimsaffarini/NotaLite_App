import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/core/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    this.buttonWidth,
    this.buttonHeight,
    this.buttonRadius,
    required this.buttonText,
    this.horizontalPadding,
    this.verticalPadding,
  });
  final void Function()? onPressed;
  final double? buttonWidth;
  final double? buttonHeight;
  final double? buttonRadius;
  final String buttonText;
  final double? horizontalPadding;
  final double? verticalPadding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding?.w ?? 0,
        vertical: verticalPadding?.h ?? 0,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          fixedSize:
              Size(buttonWidth?.w ?? double.maxFinite, buttonHeight?.h ?? 50.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(buttonRadius?.r ?? 10.r),
          ),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
