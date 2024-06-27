import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/features/home/ui/widgets/custom_search_bar.dart';
import 'package:to_do/features/home/ui/widgets/notes_list_view.dart';
import 'package:to_do/features/home/ui/widgets/recents_tasks_text.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomSearchBar(),
        SizedBox(height: 24.h),
        const RecentsTasksText(),
        SizedBox(height: 14.h),
        const NotesListView(),
      ],
    );
  }
}
