import "package:flutter/material.dart";
import 'package:carousel_slider/carousel_slider.dart';
import 'package:project2/screens/movie_info_screen.dart';
import 'package:project2/screens/sign_up_screen.dart';
import 'package:project2/widgets/bottom_bar.dart';
import 'package:project2/widgets/filter_row.dart';
import 'package:project2/widgets/heading_text.dart';
import '../widgets/movie_row.dart';
import 'package:project2/models/DiscoverMovieModel.dart';
import 'package:project2/service/api_call.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<DiscoverMovieModel> content = [];

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
  final scrollcontroller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScrollAppBar(
        controller: scrollcontroller,
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        backgroundColor: const Color(0xFF09090F),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Hello $user                   ",
                style: const TextStyle(
                    fontFamily: "Inter", fontWeight: FontWeight.bold)),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUp()));
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
        controller: scrollcontroller,
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
                      suffixIcon: const Icon(Icons.filter_alt_outlined),
                      suffixIconColor: Colors.white,
                      prefixIconColor: Colors.white),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              CarouselSlider(
                items: imgLists
                    .map((item) => InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MovieInfo(movieid: "603692")));
                          },
                          child: Center(
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.asset(
                                    item,
                                    width: 180,
                                    height: 245,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Black Panther",
                                  style: TextStyle(
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 22,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          color: Color(0xff51535E),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      alignment: Alignment.center,
                                      child: const Text(
                                        "18+",
                                        style: TextStyle(
                                            fontFamily: "Inter",
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13,
                                            color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 22,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          color: Color(0xff51535E),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      alignment: Alignment.center,
                                      child: const Text(
                                        "Action",
                                        style: TextStyle(
                                            fontFamily: "Inter",
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13,
                                            color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 22,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: Color(0xff51535E),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      alignment: Alignment.center,
                                      child: const Text(
                                        "Eng",
                                        style: TextStyle(
                                            fontFamily: "Inter",
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13,
                                            color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ))
                    .toList(),
                options: CarouselOptions(
                  autoPlayInterval: Duration(seconds: 2),
                  viewportFraction: 0.55,
                  height: 450,
                  autoPlay: true,
                  aspectRatio: 3.0,
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
              ),
              const SizedBox(
                height: 20,
              ),
              TextHeading(heading: "Trending Movies"),
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
              const SizedBox(
                height: 20,
              ),
              TextHeading(heading: "Genere"),
              FilterRow(count: 10, elements: [
                "Action",
                "Adventure",
                "Drama",
                "Comedy",
                "Fantasy",
                "Crime",
                "K-Drama",
                "Sports",
                "Fiction",
                "Romance"
              ]),
              const SizedBox(
                height: 20,
              ),
              TextHeading(heading: "Suggested for you"),
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
              const SizedBox(
                height: 20,
              ),
              TextHeading(heading: "90 's Hits"),
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
              const SizedBox(
                height: 20,
              ),
              TextHeading(heading: "Languages"),
              FilterRow(count: 5, elements: [
                "English",
                "Hindi",
                "Marathi",
                "Japanses",
                "French",
              ]),
              const SizedBox(
                height: 20,
              ),
              TextHeading(heading: "You may also like"),
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
              const SizedBox(
                height: 20,
              ),
              TextHeading(heading: "Top Romantic Hits"),
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
