import 'package:flutter/material.dart';
import 'package:project2/screens/settings_screen.dart';
import 'home_screen.dart';

class WatchlistScreen extends StatefulWidget {
  const WatchlistScreen({Key? key}) : super(key: key);

  @override
  State<WatchlistScreen> createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen> {
  int screen_index = 2;
  int count = 3;
  final List<String> imgLists = [
    'assets/images/testimg1.png',
    'assets/images/testimg3.png',
    'assets/images/testimg4.png',
    'assets/images/testimg5.png',
    'assets/images/testimg6.png',
    'assets/images/testimg7.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,toolbarHeight: 100,
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
      body: Padding(
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
                  children: const [
                    Icon(Icons.search),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(Icons.filter_list_outlined),
                    SizedBox(
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
                        borderRadius: BorderRadius.circular(6)),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
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
                        borderRadius: BorderRadius.circular(6)),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
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
                        borderRadius: BorderRadius.circular(6)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.arrow_upward,
                      color: Color(0xFF00B5F3),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Date Added",
                      style: TextStyle(
                          color: Color(0xFF00B5F3),
                          fontWeight: FontWeight.bold,
                          fontFamily: "Inter",
                          fontSize: 12),
                    )
                  ],
                ),
                Text("$count items",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Inter",
                        fontSize: 14))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 450,
              width: 350,
              child: ListView.builder(
                itemCount: imgLists.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, index) {
                  return Container(
                    height: 150,
                    width: 350,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 130,
                          width: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(imgLists[index]),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Puss in Boots: The Last Wish",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Inter",
                                  fontSize: 10),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                                "Animation, Adventure, Comedy, Family, Fantasy",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Inter",
                                    fontSize: 8)),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(Icons.calendar_month),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text("7 December, 2022",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Inter",
                                        fontSize: 6)),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 8),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            screen_index = index;
            if (screen_index == 2) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const WatchlistScreen()));
            }

            if (screen_index == 3) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsScreen()));
            }

            else if (screen_index == 0) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
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
