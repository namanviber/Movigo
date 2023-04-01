import "package:flutter/material.dart";
import 'package:carousel_slider/carousel_slider.dart';
import 'package:project2/models/MovieDetailModel.dart';
import 'package:project2/screens/sign_up_screen.dart';
import 'package:project2/widgets/bottom_bar.dart';
import 'package:project2/widgets/filter_row.dart';
import 'package:project2/widgets/heading_text.dart';
import '../widgets/movie_row.dart';
import 'package:project2/models/DiscoverMovieModel.dart';
import 'package:project2/service/api_call.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<DiscoverMovieModel> _discoverMovie = [];
  late MovieDetailModel _movieDetail;
  int moviecode = 76600;

  @override
  void initState() {
    super.initState();
    fetchMovies();
    fetchMovieDetails(moviecode);
  }

  Future<void> fetchMovies() async {
    final response1 = await discoverMovies();
    setState(() {
      _discoverMovie = response1;
    });
  }

  Future<void> fetchMovieDetails(int movieid) async {
    final response2 = await movieDetails(movieid);
    setState(() {
      _movieDetail = response2;
    });
  }

  String user = "Naman";
  int screen_index = 0;
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
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SignUp()));
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
                items: _discoverMovie
                    .map((item) => InkWell(
                          onTap: () {},
                          child: Column(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(16.0),
                                  child: Image.network(
                                    "https://image.tmdb.org/t/p/original${item.posterPath}",
                                    fit: BoxFit.cover,
                                    height: 245,
                                    width: 180,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Image.asset(
                                        "assets/images/noimage.png",
                                        fit: BoxFit.cover,
                                      );
                                    },
                                  )),
                              const SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: Text(
                                  "${item.originalTitle}",
                                  style: GoogleFonts.montserrat(fontSize: 17, fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 22,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        color: Color(0xff51535E),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Center(
                                      child: Text(
                                        "18+",
                                        style:
                                            GoogleFonts.montserrat(fontSize: 13, fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 22,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        color: Color(0xff51535E),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Center(
                                      child: Text(
                                        "Action",
                                        style:
                                        GoogleFonts.montserrat(fontSize: 13, fontWeight: FontWeight.w600),
                                      ),
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
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Center(
                                      child: Text(
                                        "en",
                                        style:
                                        GoogleFonts.montserrat(fontSize: 13, fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ))
                    .toList(),
                options: CarouselOptions(
                  autoPlayInterval: const Duration(seconds: 2),
                  viewportFraction: 0.55,
                  height: 480,
                  autoPlay: true,
                  aspectRatio: 3.0,
                  enlargeCenterPage: true,
                ),
              ),
              TextHeading(heading: "Discover Movies"),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 170,
                width: double.maxFinite,
                child: ListView.separated(
                  itemCount: _discoverMovie.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, index) {
                    final movie = _discoverMovie[index];
                    return MovieRow(
                      model: movie,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 20,
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextHeading(heading: "Trending Movies"),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 170,
                width: double.maxFinite,
                child: ListView.separated(
                  itemCount: _discoverMovie.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, index) {
                    final movie = _discoverMovie[index];
                    return MovieRow(
                      model: movie,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 20,
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextHeading(heading: "Genere"),
              const SizedBox(
                height: 20,
              ),
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
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 170,
                width: double.maxFinite,
                child: ListView.separated(
                  itemCount: _discoverMovie.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, index) {
                    final movie = _discoverMovie[index];
                    return MovieRow(
                      model: movie,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 20,
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextHeading(heading: "90 's Hits"),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 170,
                width: double.maxFinite,
                child: ListView.separated(
                  itemCount: _discoverMovie.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, index) {
                    final movie = _discoverMovie[index];
                    return MovieRow(
                      model: movie,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 20,
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextHeading(heading: "Languages"),
              const SizedBox(
                height: 20,
              ),
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
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 170,
                width: double.maxFinite,
                child: ListView.separated(
                  itemCount: _discoverMovie.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, index) {
                    final movie = _discoverMovie[index];
                    return MovieRow(
                      model: movie,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 20,
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextHeading(heading: "Top Romantic Hits"),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 170,
                width: double.maxFinite,
                child: ListView.separated(
                  itemCount: _discoverMovie.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, index) {
                    final movie = _discoverMovie[index];
                    return MovieRow(
                      model: movie,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 20,
                    );
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
