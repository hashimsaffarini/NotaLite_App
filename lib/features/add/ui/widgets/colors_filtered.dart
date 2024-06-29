import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/core/utils/app_colors.dart';
import 'package:to_do/features/add/logic/add_note/add_note_cubit.dart';

class ColorsFiltered extends StatefulWidget {
  const ColorsFiltered({super.key});

  @override
  State<ColorsFiltered> createState() => _ColorsFilteredState();
}

class _ColorsFilteredState extends State<ColorsFiltered> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 14.w : 0,
              right: 8.w,
            ),
            child: GestureDetector(
              onTap: () {
                BlocProvider.of<AddNoteCubit>(context).color = colors[index];
                setState(() {
                  selectedIndex = index;
                });
              },
              child: ColorItem(
                color: colors[index],
                selected: selectedIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}

class ColorItem extends StatelessWidget {
  const ColorItem({
    super.key,
    required this.color,
    required this.selected,
  });
  final Color color;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 36,
      backgroundColor: selected ? AppColors.textColor : color,
      child: CircleAvatar(
        radius: 32,
        backgroundColor: color,
      ),
    );
  }
}

List<Color> colors = [
  AppColors.noteBackGround,
  const Color(0xffE45555),
  const Color(0xffF4BF4F),
  const Color(0xffC9F44F),
  const Color(0xff4FF4C9),
  AppColors.primaryColor,
];
