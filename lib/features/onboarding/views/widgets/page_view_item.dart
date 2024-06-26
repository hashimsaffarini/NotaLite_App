import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/core/theming/styles.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
  });
  final String imageUrl;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imageUrl,
          ),
          SizedBox(height: 70.h),
          Text(
            title,
            style: TextStyles.font24BlackRegular.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyles.font14BlackRegular,
            ),
          ),
        ],
      ),
    );
  }
}
