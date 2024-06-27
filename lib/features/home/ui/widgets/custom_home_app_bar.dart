import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:to_do/core/theming/styles.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String greeting = now.hour < 12 ? 'Good Morning!' : 'Good Evening!';
    return Padding(
      padding: const EdgeInsets.only(left: 36, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            greeting,
            style: TextStyles.font24BlackRegular.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            DateFormat('EEEE, MMMM d, y').format(DateTime.now()),
            style: TextStyles.font20BlackRegular.copyWith(
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
