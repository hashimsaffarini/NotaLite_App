import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/features/onboarding/views/widgets/on_boarding_page_view.dart';
import 'package:to_do/features/onboarding/views/widgets/onboarding_app_bar.dart';
import 'package:to_do/features/onboarding/views/widgets/page_indicator_and_button.dart';

class OnBoardingPageViewBody extends StatefulWidget {
  const OnBoardingPageViewBody({super.key});

  @override
  State<OnBoardingPageViewBody> createState() => _OnBoardingPageViewBodyState();
}

class _OnBoardingPageViewBodyState extends State<OnBoardingPageViewBody> {
  late PageController pageController;
  var currentPage = 0;
  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const OnboardingScreenAppBar(),
        Expanded(
          child: OnBoardingPageView(
            controller: pageController,
          ),
        ),
        PageIndicatorAndButton(
          currentPage: currentPage,
          pageController: pageController,
        ),
        SizedBox(height: 40.h),
      ],
    );
  }
}
