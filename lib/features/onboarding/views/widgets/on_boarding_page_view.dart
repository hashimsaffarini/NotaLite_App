import 'package:flutter/material.dart';
import 'package:to_do/core/utils/app_images.dart';
import 'package:to_do/features/onboarding/views/widgets/page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.controller});
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      children: const [
        PageViewItem(
          imageUrl: Assets.imagesBoarding1,
          title: 'Welcome to NotaLite!',
          description:
              'Start your journey towards enhanced productivity with NotaLite! Our intuitive task management app helps you stay organized and focused.',
        ),
        PageViewItem(
          imageUrl: Assets.imagesOBJECTS,
          title: 'Effortless Management',
          description:
              'Say goodbye to overwhelming to-do lists and hello to effortless task management! With NotaLite, you can easily add, prioritize, and track your tasks with just a few taps.',
        ),
      ],
    );
  }
}
