import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/core/theming/font_weight_helper.dart';

class TextStyles {
  static TextStyle font24BlackRegular = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.regular,
    color: Colors.black,
  );
  static TextStyle font14BlackRegular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: Colors.black.withOpacity(0.55),
  );
  static TextStyle font20BlackRegular = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.regular,
    color: Colors.black,
  );
}
