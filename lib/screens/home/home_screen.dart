import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import "package:flutter/material.dart";
import 'package:carousel_slider/carousel_slider.dart';
import 'package:project2/service/mongoDbCall.dart';
import 'package:project2/widgets/bottom_bar.dart';
import 'package:project2/models/DiscoverMovieModel.dart';
import 'package:project2/service/apiCall.dart';
import 'package:project2/widgets/futureMovieList.dart';
import 'package:project2/widgets/grid_of_genre.dart';
import 'package:project2/widgets/recommendMovieList.dart';

import '../../models/MovieDetailModel.dart';
import 'movieDetail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Movie models
  List<DiscoverMovieModel> _discoverMovie = [];
  var fetchmoviedb = MongoDatabase.getMovies();
  var fetchpopularmovie = MongoDatabase.getPopularMovies();
  var scifimovie = MongoDatabase.getScifiMovies();
  var animationmovie = MongoDatabase.getAnimationMovies();
  var topRatedmovie = MongoDatabase.getTopRated();
  var horrorComedymovie = MongoDatabase.getHorrorComedy();
  var actionmovie = MongoDatabase.getActionMovies();
  var fantasymovie = MongoDatabase.getFantasyMovies();
  var romancemovie = MongoDatabase.getRomanceMovies();
  var crimemovie = MongoDatabase.getCrimeMovies();
  var userrecommendation;
  var itemrecommendation;

  @override
  void initState() {
    fetchMovies();
    userrecommendation = fetchuserRecommendations();
    itemrecommendation = fetchitemRecommendations();
    super.initState();
  }

  Future<void> fetchMovieDetails(int movieid) async {
    final response3 = await movieDetails(movieid);
    setState(() {
      MovieDetailModel movieDetail = response3;
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MovieInfo(
                movieModel: movieDetail, data: false,
              )));
    });
  }

  Future<List<Map<String, dynamic>>> fetchuserRecommendations() async {
    final response1 = await MongoDatabase.userRecommendations();
    final result = await MongoDatabase.preferredMovies(response1);
    return result;
  }

  Future<List<Map<String, dynamic>>> fetchitemRecommendations() async {
    final response1 = await MongoDatabase.itemRecommendations();
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
      appBar:AppBar(
        automaticallyImplyLeading:false,

        backgroundColor: Colors.transparent,

        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 40,
                child: Image.asset("assets/images/Movigo.png", fit: BoxFit.fitHeight,)),
            GestureDetector(
              onTap: (){Navigator.pushNamed(context, "/Profilepage");},
              child: CircleAvatar(
                backgroundColor: Theme.of(context).cardColor,
                radius: 20,
                child: Text(
                  FirebaseAuth.instance.currentUser!.email![0].toUpperCase(),
                  style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).textTheme.titleSmall!.color),
                ),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            CarouselSlider(
              items: _discoverMovie
                  .map((item) => InkWell(
                onTap: () {
                  fetchMovieDetails(item.id);
                },
                child: SizedBox(
                  height: 200,
                  child: Column(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: Image.network(
                            "https://image.tmdb.org/t/p/original${item.posterPath}",
                            fit: BoxFit.fitHeight,
                            height: 300,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                "assets/images/noimage.png",
                                fit: BoxFit.fitHeight,
                              );
                            },
                          )),
                    ],
                  ),
                ),
              ))
                  .toList(),
              options: CarouselOptions(
                height: 320,
                enlargeCenterPage: true,
                enlargeFactor: 0.12,
                viewportFraction: 0.55,
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 4),
                scrollDirection: Axis.horizontal,
                aspectRatio: 2.0,
                clipBehavior: Clip.none
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  recommendMovieList(
                      heading: "Recommended For You", movies: userrecommendation),
                  recommendMovieList(
                      heading: "Suggested For You", movies: itemrecommendation),
                  SizedBox(height: 20,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 190,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white,width: 2),
                      gradient: LinearGradient(
                        colors: const [Color(0xFF530593), Color(0xFF00FFD8)],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      heading: "Popular Movies", movies: fetchpopularmovie),
                  futureMovieList(
                      heading: "Top Rated Movies", movies: topRatedmovie),

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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      heading: "Discover Movies", movies: fetchmoviedb),
                  futureMovieList(
                      heading: "Top SciFi", movies: scifimovie),
                  futureMovieList(
                      heading: "Top Action", movies: actionmovie),
                  SizedBox(height: 20,),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 190,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white,width: 2),
                      gradient: LinearGradient(
                        colors: const [Color(0xffde8041), Color(0xffe84b1b)],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: 170,
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Search for your favourite Movies",
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
                                      "Find your favourite movies by title name",
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
                                    'assets/images/cardimg4.png',
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
                                  Colors.white
                              ),
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: 170,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Want to Update your profile",
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
                                      "Change Your Profile Data Here!",
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
                                    'assets/images/cardimage3.png',
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
                                  context, '/Profilepage');
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
