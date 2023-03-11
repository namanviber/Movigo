import "package:flutter/material.dart";
import 'package:carousel_slider/carousel_slider.dart';
import 'package:project2/screens/login_screen.dart';
import 'package:project2/widgets/bottom_bar.dart';
import 'package:project2/widgets/heading_text.dart';
import '../widgets/movie_row.dart';
import 'package:project2/models/movie_model.dart';
import 'package:project2/service/api_call.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        toolbarHeight: 80,
        backgroundColor: const Color(0xFF09090F),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Hello $user",
                style: const TextStyle(
                    fontFamily: "Inter", fontWeight: FontWeight.bold)),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Container(
                child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: SizedBox(
                        width: 60,
                        height: 60,
                        child: ClipOval(
                          child: Image.asset("assets/images/testimg2.png"),
                        ))),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              SizedBox(
                width: 340,
                height: 60,
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                      hintText: "Search",
                      filled: true,
                      fillColor: const Color(0xFF131313),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          borderSide: BorderSide.none),
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: const Icon(Icons.history_rounded),
                      suffixIconColor: Colors.white,
                      prefixIconColor: Colors.white),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: const Text("Filters",
                    style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.bold,
                        fontSize: 17)),
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
                  ),
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
                  ),
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
                  ),
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
                        fontSize: 22)),
              ),
              const SizedBox(
                height: 20,
              ),
              CarouselSlider(
                items: imgLists
                    .map((item) => Container(
                          child: Center(
                            child: Column(
                              children: [
                                Image.asset(
                                  item,
                                  width: 150,
                                  height: 220,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Black Panther: Wakanda Forever",
                                  style: TextStyle(
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ))
                    .toList(),
                options: CarouselOptions(
                  height: 320,
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                ),
              ),
            TextHeading(heading: "Top 10 in India"),
              Container(
                height: 170,
                width: double.maxFinite,
                child: ListView.builder(
                  itemCount: content.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, index) {
                    final movie = content[index];
                    return MovieRow(model: movie);
                  },
                ),
              ),TextHeading(heading: "Trending Movies"),
              Container(
                height: 170,
                width: double.maxFinite,
                child: ListView.builder(
                  itemCount: content.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, index) {
                    final movie = content[index];
                    return MovieRow(model: movie);
                  },
                ),
              ),TextHeading(heading: "Suggested for you"),
              Container(
                height: 170,
                width: double.maxFinite,
                child: ListView.builder(
                  itemCount: content.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, index) {
                    final movie = content[index];
                    return MovieRow(model: movie);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        screen_index: 0,
      ),
    );
  }
}
