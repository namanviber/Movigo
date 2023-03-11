import 'package:flutter/material.dart';
import 'package:project2/screens/home_screen.dart';
import 'package:project2/screens/watchlist_screen.dart';
import 'package:project2/screens/recommender_screen.dart';
import 'package:project2/screens/settings_screen.dart';
import 'package:project2/service/testrecommend.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({required this.screen_index, Key? key}) : super(key: key);
  int screen_index;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        screen_index = index;
        if (screen_index == 2) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => WatchlistScreen()));
        } else if (screen_index == 0) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        } else if (screen_index == 1) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MovieTab()));
        }else if (screen_index == 3) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SettingsScreen()));
        }
      },
      currentIndex: screen_index,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(Icons.play_circle), label: "Recommender"),
        BottomNavigationBarItem(
            icon: Icon(Icons.library_add), label: "Watchlist"),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings_rounded), label: "Settings"),
      ],
      backgroundColor: const Color(0xFF09090F),
      selectedItemColor: Color(0xFF00B5F3),
      unselectedItemColor: Colors.white,
      // type: BottomNavigationBarType.shifting,
    );
  }
}
