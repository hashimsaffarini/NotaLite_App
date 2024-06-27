import 'package:flutter/material.dart';
import 'package:to_do/core/theming/styles.dart';
import 'package:to_do/core/utils/app_colors.dart';
class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.9,
      ),
      decoration: BoxDecoration(
        color: AppColors.noteBackGround,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Note Title: The user can do with \n',
              style: TextStyles.font14BlackRegular.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: AppColors.textColor,
              ),
            ),
            Text(
              'Date: ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
              style: TextStyles.font14BlackRegular,
            ),
            Row(
              children: [
                Text(
                  'Time: ${DateTime.now().hour}:${DateTime.now().minute}',
                  style: TextStyles.font14BlackRegular,
                ),
                const Spacer(),
                IconButton(
                  iconSize: 20,
                  icon: const Icon(Icons.favorite_border),
                  onPressed: () {},
                ),
                IconButton(
                  iconSize: 20,
                  style: ButtonStyle(
                    padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.all(0),
                    ),
                  ),
                  icon: const Icon(Icons.delete),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
