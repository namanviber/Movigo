import "package:flutter/material.dart";
import 'package:project2/widgets/bottom_bar.dart';
import '../widgets/movie_card.dart';
import 'package:project2/models/movie_model.dart';
import 'package:project2/service/api_call.dart';

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

  List<MovieModel> content = [];

  @override
  void initState() {
    super.initState();
    fetchMovies();
  }

  Future<void> fetchMovies() async {
    final response = await discoverMovies();
    setState(() {
      content = response;
    });
  }

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
                      child: const Text("Movies",
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
                      child: const Text(
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
                    decoration: BoxDecoration(
                        color: const Color(0xFF00B5F3),
                        borderRadius: BorderRadius.circular(6)),
                    child: const Text(
                      "All Movies",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Inter",
                          fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 30,
                    width: 150,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6)),
                    child: const Text(
                      "Unwatched Movies",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Inter",
                          fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 30,
                    width: 150,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6)),
                    child: const Text(
                      "Watched Movies",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Inter",
                          fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
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
                  children: const [
                    Icon(
                      Icons.arrow_upward,
                      color: Color(0xFF00B5F3),
                    ),
                    SizedBox(
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
                    style: const TextStyle(
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
                itemCount: content.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, index) {
                  final movie = content[index];
                  return MovieCard(movie: movie);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(screen_index: 2,),

    );
  }
}
