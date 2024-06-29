import 'package:flutter/material.dart';
import 'package:to_do/core/theming/styles.dart';

class AddPageAppBar extends StatelessWidget {
  const AddPageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 36, top: 20),
      child: Column(
        children: [
          Text(
            'Add New Note',
            style: TextStyles.font24BlackRegular.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
