import "package:flutter/material.dart";
import 'package:project2/screens/recommender_screen.dart';
import 'package:project2/screens/settings_screen.dart';
import 'package:project2/screens/watchlist_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String user = "Naman";
  int screen_index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            TextField(
                decoration: InputDecoration(
                    hintText: "Search for movies, TV shows etc...",
                    filled: true,
                    fillColor: const Color(0xFF51535D),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none),
                    prefixIcon: const Icon(Icons.search),
                    prefixIconColor: Colors.white)),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: const Text("Filters",
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
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
              height: 30,
            ),
            const SizedBox(
              height: 200,
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
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Icon(Icons.star),
                      trailing: Icon(Icons.library_add),
                      title: Text("Bhuj $index"),
                    );
                  }),
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
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            screen_index = index;
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
    );
  }
}
