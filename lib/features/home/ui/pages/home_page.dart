import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/features/home/ui/widgets/custom_home_app_bar.dart';
import 'package:to_do/features/home/ui/widgets/home_page_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomHomeAppBar(),
            SizedBox(height: 36.h),
            const HomePageBody(),
          ],
        ),
      ),
    );
  }
}
