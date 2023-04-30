import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project2/screens/authorization/preferences.dart';
import 'package:project2/service/mongoDbCall.dart';
import 'package:project2/widgets/bottom_bar.dart';
import 'package:project2/widgets/filter_row.dart';
import 'package:project2/models/DiscoverMovieModel.dart';
import 'package:project2/service/apiCall.dart';
import 'package:project2/widgets/futureMovieList.dart';
import 'package:project2/widgets/grid_of_genre.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Movie models
  List<DiscoverMovieModel> _discoverMovie = [];
  var fetchmoviedb;
  var fetchpopularmovie;
  var scifimovie;
  var animationmovie;
  var topRatedmovie;
  var horrorComedymovie;
  var actionmovie;
  var fantasymovie;
  var romancemovie;
  var crimemovie;

  // var itemrecommendation;
  var userrecommendation;

  @override
  void initState() {
    fetchMovies();
    fetchmoviedb = MongoDatabase.getMovies();
    fetchpopularmovie = MongoDatabase.getPopularMovies();
    scifimovie = MongoDatabase.getScifiMovies();
    animationmovie = MongoDatabase.getAnimationMovies();
    topRatedmovie = MongoDatabase.getTopRated();
    horrorComedymovie = MongoDatabase.getHorrorComedy();
    actionmovie = MongoDatabase.getActionMovies();
    fantasymovie = MongoDatabase.getFantasyMovies();
    romancemovie = MongoDatabase.getRomanceMovies();
    crimemovie = MongoDatabase.getCrimeMovies();
    userrecommendation = fetchRecommendations();
    super.initState();
  }

  Future<List<Map<String, dynamic>>> fetchRecommendations() async {
    final response1 = await MongoDatabase.getRecommendations();
    final result = await MongoDatabase.preferredMovies(response1);
    return result;
  }

  Future<void> fetchMovies() async {
    final response1 = await discoverMovies();
    setState(() {
      _discoverMovie = response1;
    });
  }

  //Local Variables
  int screen_index = 0;
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            CarouselSlider(
              items: _discoverMovie
                  .map((item) => InkWell(
                onTap: () {},
                child: SizedBox(
                  height: 300,
                  child: Column(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: Image.network(
                            "https://image.tmdb.org/t/p/original${item.posterPath}",
                            fit: BoxFit.cover,
                            height: 400,
                            width: 300,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                "assets/images/noimage.png",
                                fit: BoxFit.cover,
                              );
                            },
                          )),
                    ],
                  ),
                ),
              ))
                  .toList(),
              options: CarouselOptions(
                height: 410,
                viewportFraction: 0.85,
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 4),
                scrollDirection: Axis.horizontal,
                aspectRatio: 2.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  futureMovieList(
                      heading: "Movies For You", movies: userrecommendation),
                  futureMovieList(
                      heading: "Popular Movies", movies: fetchpopularmovie),
                  futureMovieList(
                      heading: "Top Rated Movies", movies: topRatedmovie),
                  // futureMovieList(
                  //     heading: "You May also Like", movies: itemrecommendation),

                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 190,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white,width: 2),
                      gradient: LinearGradient(
                        colors: const [Colors.black12, Colors.blueAccent],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 170,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Find More What You Like",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .color,
                                      ),
                                    ),
                                    Text(
                                      "Find movies based on your current mood",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .color,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                  height: 80,
                                  width: 120,
                                  child: Image.asset(
                                    'assets/images/cardimg1.png',
                                    fit: BoxFit.cover,
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          width: 290,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, '/recommender_screen');
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                            ),
                            child: Text("Try it Now"),
                          ),
                        )
                      ],
                    ),
                  ),
                  futureMovieList(
                      heading: "Discover Movies", movies: fetchmoviedb),
                  futureMovieList(
                      heading: "Top SciFi", movies: scifimovie),
                  futureMovieList(
                      heading: "Top Action", movies: actionmovie),
              Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Top Genres",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color:
                                Theme.of(context).textTheme.titleLarge!.color,
                          ),
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GridOfGenre()));
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios,
                          ),
                        )
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 190,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white,width: 2),
                      gradient: LinearGradient(
                        colors: const [Color(0xFF7A0000), Colors.deepPurple],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 170,
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Search Movies By Genre",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .color,
                                      ),
                                    ),
                                    Text(
                                      "Find your favourite movies by genre",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .color,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                  height: 80,
                                  width: 120,
                                  child: Image.asset(
                                    'assets/images/cardimg1.png',
                                    fit: BoxFit.cover,
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          width: 290,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => GridOfGenre()));

                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                            ),
                            child: Text("Try it Now"),
                          ),
                        )
                      ],
                    ),
                  ),
                  futureMovieList(
                      heading: "Popular Animated", movies: animationmovie),
                  futureMovieList(
                      heading: "Popular Fantasy", movies: fantasymovie),
                  futureMovieList(
                      heading: "Popular Romance", movies: romancemovie),

                  const SizedBox(
                    height: 20,
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 190,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white,width: 2),
                      gradient: LinearGradient(
                        colors: const [Color(0x21074DFF), Colors.purpleAccent],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 170,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Check out your favourite lists",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .color,
                                      ),
                                    ),
                                    Text(
                                      "Get a look at your saved movies",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .color,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                  height: 80,
                                  width: 120,
                                  child: Image.asset(
                                    'assets/images/cardimg2.png',
                                    fit: BoxFit.cover,
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          width: 290,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/watch_list');
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                            ),
                            child: Text("Try it Now"),
                          ),
                        )
                      ],
                    ),
                  ),
                  futureMovieList(
                      heading: "Mix of Horror and Comedy",
                      movies: horrorComedymovie),
                  futureMovieList(
                      heading: "Top Crime", movies: crimemovie),

                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        screen_index: 0,
      ),
    );
  }
}
