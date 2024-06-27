import 'package:flutter/material.dart';
import 'package:to_do/features/home/ui/widgets/custom_search_bar.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomSearchBar(),
      ],
    );
  }
}
