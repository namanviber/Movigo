import 'package:flutter/material.dart';
import 'home_screen.dart';

class WatchlistScreen extends StatefulWidget {
  const WatchlistScreen({Key? key}) : super(key: key);

  @override
  State<WatchlistScreen> createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen> {
  int screen_index = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        backgroundColor: const Color(0xFF09090F),
        title: TextField(
          decoration: InputDecoration(
              hintText: "Search for movies, TV shows etc...",
              filled: true,
              fillColor: const Color(0xFF51535D),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none),
              prefixIcon: const Icon(Icons.search),
              suffixIcon: const Icon(Icons.history_rounded),
              suffixIconColor: Colors.white,
              prefixIconColor: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      InkWell(
                        child: Text("Movies",
                            style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                decorationColor: Color(0xFF00B5F3),
                                decorationThickness: 2.0)),
                        onTap: () {},
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        child: Text(
                          "Shows",
                          style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.search),
                      const SizedBox(
                        width: 5,
                      ),
                      Icon(Icons.filter_list_outlined),
                      const SizedBox(
                        width: 5,
                      ),
                      Icon(Icons.grid_view),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      height: 30,
                      width: 150,
                      alignment: Alignment.center,
                      child: Text(
                        "All Movies",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Inter",
                            fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                      decoration: BoxDecoration(
                          color: Color(0xFF00B5F3),
                        borderRadius: BorderRadius.circular(6)
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),Container(
                      height: 30,
                      width: 150,
                      alignment: Alignment.center,
                      child: Text(
                        "Unwatched Movies",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Inter",
                            fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6)
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),Container(
                      height: 30,
                      width: 150,
                      alignment: Alignment.center,
                      child: Text(
                        "Watched Movies",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Inter",
                            fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6)
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            screen_index = index;
            if (screen_index == 2) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WatchlistScreen()));
            } else if (screen_index == 0) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
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
