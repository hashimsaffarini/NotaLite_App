import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:to_do/core/utils/app_colors.dart';
import 'package:to_do/core/widgets/custom_cuircle_button.dart';

class PageIndicatorAndButton extends StatelessWidget {
  const PageIndicatorAndButton({
    super.key,
    required this.pageController,
    required this.currentPage,
  });
  final int currentPage;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: Row(
        children: [
          SmoothPageIndicator(
            count: 2,
            controller: pageController,
            effect: ExpandingDotsEffect(
              activeDotColor: AppColors.primaryColor,
              dotColor: currentPage == 1
                  ? AppColors.primaryColor
                  : AppColors.primaryColor.withOpacity(0.5),
              dotHeight: 10.r,
              dotWidth: 12.r,
              spacing: 8.r,
            ),
            onDotClicked: (index) {
              pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
              );
            },
          ),
          const Spacer(),
          const CustomCircleButton(),
        ],
      ),
    );
  }
}
