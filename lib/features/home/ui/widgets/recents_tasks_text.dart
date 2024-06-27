import 'package:flutter/material.dart';
import 'package:to_do/core/theming/styles.dart';
import 'package:to_do/core/utils/app_colors.dart';

class RecentsTasksText extends StatelessWidget {
  const RecentsTasksText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Recents Tasks',
      style: TextStyles.font24BlackRegular.copyWith(
        fontWeight: FontWeight.bold,
        color: AppColors.secondaryBlack,
      ),
    );
  }
}
