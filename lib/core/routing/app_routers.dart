import 'package:flutter/material.dart';
import 'package:to_do/core/routing/routes.dart';
import 'package:to_do/features/home/ui/pages/home_page.dart';
import 'package:to_do/features/onboarding/views/screens/onboarding_screen.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());

      default:
        return null;
    }
  }
}
