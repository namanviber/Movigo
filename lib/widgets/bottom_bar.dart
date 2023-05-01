import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({required this.screen_index, Key? key}) : super(key: key);
  int screen_index;

  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(
      onTap: (index) {
        screen_index = index;
        if (screen_index == 0) {
          Navigator.pushReplacementNamed(context, '/home_screen');
        } else if (screen_index == 1) {
          Navigator.pushReplacementNamed(context, '/search_screen');
        } else if (screen_index == 2) {
          Navigator.pushReplacementNamed(context, '/watch_list');
        } else if (screen_index == 3) {
          Navigator.pushReplacementNamed(context, '/setting_screen');
        }
      },
      currentIndex: screen_index,
      items: [
        SalomonBottomBarItem(
            selectedColor: Theme.of(context).bottomAppBarTheme.color,
            title: const Text('Home'),
            icon: const Icon(Icons.home_filled,size: 25,)),
        SalomonBottomBarItem(
            selectedColor: Theme.of(context).bottomAppBarTheme.color,
            title: const Text('Search'),
            icon: const Icon(Icons.search_rounded)),
        SalomonBottomBarItem(
            selectedColor: Theme.of(context).bottomAppBarTheme.color,
            title: const Text('Watchlist'),
            icon: const Icon(Icons.bookmark)),
        SalomonBottomBarItem(
            selectedColor: Theme.of(context).bottomAppBarTheme.color,
            title: const Text('Settings'),
            icon: const Icon(Icons.person)),
      ],
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      unselectedItemColor: Color(0xFFA0A0A0),
      // type: BottomNavigationBarType.shifting,
    );
  }
}
