import 'package:flutter/material.dart';
import 'package:project2/screens/home_screen.dart';
import 'package:project2/screens/watchlist_screen.dart';
import 'package:project2/screens/recommender_screen.dart';
import 'package:project2/screens/settings_screen.dart';
import 'package:project2/service/apiCall.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({required this.screen_index, Key? key}) : super(key: key);
  int screen_index;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        screen_index = index;
        if (screen_index == 3) {
          Navigator.pushNamed(context, '/watch_list');
        } else if (screen_index == 0) {
          Navigator.pushNamed(context, '/home_screen');
        } else if (screen_index == 2) {
                Navigator.pushNamed(context, '/search_screen');
        } else if (screen_index == 1) {
          Navigator.pushNamed(context, '/recommender_screen');

        } else if (screen_index == 4) {
          Navigator.pushNamed(context, '/setting_screen');

        }
      },
      currentIndex: screen_index,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(Icons.play_circle), label: "Find Movie"),
        BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded), label: "Search"),
        BottomNavigationBarItem(
            icon: Icon(Icons.library_add), label: "Watchlist"),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings_rounded), label: "Settings"),
      ],
      backgroundColor: const Color(0xFF09090F),
      selectedItemColor: Colors.white,
      unselectedItemColor: Color(0xFFA0A0A0),
      // type: BottomNavigationBarType.shifting,
    );
  }
}
