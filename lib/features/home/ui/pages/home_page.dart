import 'package:flutter/material.dart';
import 'package:to_do/features/home/ui/widgets/custom_home_app_bar.dart';
import 'package:to_do/features/home/ui/widgets/home_page_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomHomeAppBar(),
            HomePageBody(),
          ],
        ),
      ),
    );
  }
}
