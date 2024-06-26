import 'package:flutter/material.dart';
import 'package:to_do/features/onboarding/views/widgets/on_boarding_page_view_body.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: OnBoardingPageViewBody(),
      ),
    );
  }
}
