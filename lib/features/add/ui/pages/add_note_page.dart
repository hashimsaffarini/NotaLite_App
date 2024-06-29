import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/features/add/ui/widgets/add_page_app_bar.dart';
import 'package:to_do/features/add/ui/widgets/add_page_body.dart';

class AddNotePage extends StatelessWidget {
  const AddNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AddPageAppBar(),
              SizedBox(height: 24.h),
              const AddPageBody(),
            ],
          ),
        ),
      ),
    );
  }
}
