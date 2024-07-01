import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do/core/utils/app_images.dart';
import 'package:to_do/features/add/ui/pages/add_note_page.dart';
import 'package:to_do/features/add/logic/add_note/add_note_cubit.dart';
import 'package:to_do/features/home/logic/notes/notes_cubit.dart';
import 'package:to_do/features/home/ui/pages/home_page.dart';
import 'package:to_do/features/priority/ui/pages/priority_task_page.dart';

class NavBar extends StatefulWidget {
  final int initialIndex;
  static final GlobalKey<NavBarState> globalKey = GlobalKey<NavBarState>();

  const NavBar({super.key, this.initialIndex = 0});

  @override
  State<NavBar> createState() => NavBarState();
}

class NavBarState extends State<NavBar> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  void updateIndex(int newIndex) {
    setState(() {
      _currentIndex = newIndex;
    });
  }

  List<Widget> list = [
    BlocProvider(
      create: (context) => NotesCubit()..fetchAllNotes(),
      child: const HomePage(),
    ),
    BlocProvider(
      create: (context) => AddNoteCubit(),
      child: const AddNotePage(),
    ),
    const PriorityTaskPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        backgroundColor: Colors.white,
        height: MediaQuery.of(context).size.height * 0.1,
        indicatorColor: Colors.transparent,
        destinations: [
          NavigationDestination(
            selectedIcon: SvgPicture.asset(
              Assets.imagesHomeActive,
            ),
            icon: SvgPicture.asset(
              Assets.imagesHomeNonActive,
            ),
            label: 'Home',
          ),
          NavigationDestination(
            icon: SvgPicture.asset(
              Assets.imagesPlusNonAvtive,
            ),
            selectedIcon: SvgPicture.asset(
              Assets.imagesPlusActive,
            ),
            label: 'Add',
          ),
          NavigationDestination(
            icon: SvgPicture.asset(
              Assets.imagesStarNonActive,
            ),
            selectedIcon: SvgPicture.asset(
              Assets.imagesStarActive,
            ),
            label: 'Priority',
          ),
        ],
        selectedIndex: _currentIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
