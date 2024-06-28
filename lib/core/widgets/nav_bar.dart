import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do/core/utils/app_images.dart';
import 'package:to_do/features/add/ui/pages/add_note_page.dart';
import 'package:to_do/features/home/ui/pages/home_page.dart';
import 'package:to_do/features/priority/ui/pages/priority_task_page.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;

  List<Widget> list = const [
    HomePage(),
    AddNotePage(),
    PriorityTaskPage(),
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
