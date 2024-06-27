import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do/core/theming/styles.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Good Morning!',
          style: TextStyles.font24BlackRegular.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          DateFormat('EEEE, MMMM d, y').format(DateTime.now()),
          style: const TextStyle(fontSize: 20),
        )
      ],
    );
  }
}
