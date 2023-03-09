import "package:flutter/material.dart";
import 'package:carousel_slider/carousel_slider.dart';
import 'package:project2/screens/recommender_screen.dart';
import 'package:project2/screens/settings_screen.dart';
import 'package:project2/screens/watchlist_screen.dart';

import '../widgets/movie_row.dart';
// <<<<<<< HEAD
// import 'package:project2/screens/settings_screen.dart';
// =======
// import 'package:project2/screens/recommender_screen.dart';
// >>>>>>> dd9e608a7942af7d158e2354628546d146a6edd5
// import 'package:project2/screens/watchlist_screen.dart';
// import 'package:project2/widgets/movie_row.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String user = "Naman";
  int screen_index = 0;
  final List<String> imgLists = [
    'assets/images/testimg1.png',
    'assets/images/testimg3.png',
    'assets/images/testimg4.png',
    'assets/images/testimg5.png',
    'assets/images/testimg6.png',
    'assets/images/testimg7.png',
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        backgroundColor: const Color(0xFF09090F),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Hello $user",
                style: const TextStyle(
                    fontFamily: "Inter", fontWeight: FontWeight.bold)),
            Container(
              child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: SizedBox(
                      width: 60,
                      height: 60,
                      child: ClipOval(
                        child: Image.asset("assets/images/testimg2.png"),
                      ))),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              TextField(
                  decoration: InputDecoration(
                      hintText: "Search for movies, TV shows etc...",
                      filled: true,
                      fillColor: const Color(0xFF51535D),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none),
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: const Icon(Icons.mic),
                      suffixIconColor: Colors.white,
                      prefixIconColor: Colors.white),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: const Text("Quick Access Panel",
                    style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: [
                      InkWell(
                        child: Container(
                          height: 55.0,
                          width: 55.0,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color(0xff51535E),
                          ),
                          child: const Icon(Icons.grid_view_rounded,
                              color: Colors.white, size: 40.0),
                        ),
                        onTap: () {},
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("Grid")
                    ],
                  ),Column(
                    children: [
                      InkWell(
                        child: Container(
                          height: 55.0,
                          width: 55.0,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color(0xff51535E),
                          ),
                          child: const Icon(Icons.star,
                              color: Colors.white, size: 40.0),
                        ),
                        onTap: () {},
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("Favourites")
                    ],
                  ),Column(
                    children: [
                      InkWell(
                        child: Container(
                          height: 55.0,
                          width: 55.0,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color(0xff51535E),
                          ),
                          child: const Icon(Icons.language,
                              color: Colors.white, size: 40.0),
                        ),
                        onTap: () {},
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("Language")
                    ],
                  ),Column(
                    children: [
                      InkWell(
                        child: Container(
                          height: 55.0,
                          width: 55.0,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color(0xff51535E),
                          ),
                          child: const Icon(Icons.history_rounded,
                              color: Colors.white, size: 40.0),
                        ),
                        onTap: () {},
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("Watched")
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: const Text("Now Showing",
                    style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
              ),
              const SizedBox(
                height: 20,
              ),
              CarouselSlider(
                items: imgLists
                    .map((item) => Container(
                          child: Center(
                            child: Image.asset(
                              item,
                              width: 200,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ))
                    .toList(),
                options: CarouselOptions(
                  height: 270,
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: const Text("Movies for You",
                    style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
              ),
              const SizedBox(
                height: 20,
              ),
              const MovieRow(),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: const Text("Trending",
                    style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
              ),
              const SizedBox(
                height: 20,
              ),
              const MovieRow(),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: const Text("Top 10 in India",
                    style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
              ),
              const SizedBox(
                height: 20,
              ),
              const MovieRow(),

            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            screen_index = index;
            if (screen_index == 2){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const WatchlistScreen()));
            }
            if (screen_index == 3){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsScreen()));
            }
            else if (screen_index == 0){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
            }
            else if (screen_index == 1){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const RecommenderScreen()));
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
        selectedItemColor: const Color(0xFF00B5F3),
        unselectedItemColor: Colors.white,
        // type: BottomNavigationBarType.shifting,
      ),
    );
  }
}
