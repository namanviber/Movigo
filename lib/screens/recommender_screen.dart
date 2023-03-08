import 'package:flutter/material.dart';
import 'movielist_screen.dart';
import 'home_screen.dart';
import 'watchlist_screen.dart';

class RecommenderScreen extends StatefulWidget {
  const RecommenderScreen({Key? key}) : super(key: key);

  @override
  State<RecommenderScreen> createState() => _RecommenderScreenState();
}

class _RecommenderScreenState extends State<RecommenderScreen> {
  int screen_index = 1;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(),
        body: MovieTab(),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              screen_index = index;
              if (screen_index == 2){
                Navigator.push(context, MaterialPageRoute(builder: (context) => WatchlistScreen()));
              }
              else if (screen_index == 0){
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
              }
              else if (screen_index == 1){
                Navigator.push(context, MaterialPageRoute(builder: (context) => RecommenderScreen()));
              }
            });
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
        ),
      ),
    );
  }
}
