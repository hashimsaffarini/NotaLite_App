import 'package:flutter/material.dart';
import 'package:to_do/features/onboarding/views/widgets/on_boarding_page_view.dart';

class OnBoardingPageViewBody extends StatelessWidget {
  const OnBoardingPageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(
          child: OnBoardingPageView(),
        ),
      ],
    );
  }
}
