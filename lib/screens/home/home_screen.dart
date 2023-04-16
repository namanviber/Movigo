  import 'dart:ui';
import 'package:project2/temp/temp2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:carousel_slider/carousel_slider.dart';
import 'package:project2/models/mongoDbModels/getMoviesModel.dart';
import 'package:project2/service/mongoDbCall.dart';
import 'package:project2/widgets/bottom_bar.dart';
import 'package:project2/widgets/filter_row.dart';
import 'package:project2/widgets/heading_text.dart';
import 'package:project2/widgets/movieList.dart';
import '../../widgets/movie_row.dart';
import 'package:project2/models/apiModels/DiscoverMovieModel.dart';
import 'package:project2/service/apiCall.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<DiscoverMovieModel> _discoverMovie = [];
  var fetchmoviedb;
  var fetchpopularmovie;
  var fetchscifimovie;
  var fetchkidsmovie;
  var topRatedmovie;
  var horrorComedymovie;

  @override
  void initState() {
    fetchMovies();
    fetchmoviedb = MongoDatabase.getMovies();
    fetchpopularmovie = MongoDatabase.getPopularMovies();
    fetchscifimovie = MongoDatabase.getScifiMovies();
    fetchkidsmovie = MongoDatabase.getKidsMovies();
    topRatedmovie = MongoDatabase.getTopRated();
    horrorComedymovie = MongoDatabase.getHorrorComedy();
    super.initState();
  }

  Future<void> fetchMovies() async {
    final response1 = await discoverMovies();
    setState(() {
      _discoverMovie = response1;
    });
  }

  // final user = FirebaseAuth.instance.currentUser!;
  int screen_index = 0;
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  final scrollcontroller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        // scrolledUnderElevation: true,
        backgroundColor: Colors.transparent,
        // excludeHeaderSemantics: true,
        title: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Row(
            children: [
              SizedBox(
                width: 70,
                height: 70,
                child: Image.asset(
                  'assets/images/moviegologo.png',
                  fit: BoxFit.cover,
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/search_screen');
                },
                icon: Icon(
                  Icons.search_rounded,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      // appBar: ScrollAppBar(
      //   controller: scrollcontroller,
      //   automaticallyImplyLeading: false,
      //   toolbarHeight: 80,
      //   backgroundColor: const Color(0xFF09090F),
      //   title: Padding(
      //     padding: const EdgeInsets.all(16.0),
      //     child: Row(
      //       children: [
      //         Spacer(),
      //         Icon(Icons.search_rounded)
      //       ],
      //     ),
      //     // child: Row(
      //     //   children: [
      //     //     RichText(
      //     //       text: TextSpan(children: [
      //     //         TextSpan(
      //     //           text: "Hello ",
      //     //           style: GoogleFonts.montserrat(
      //     //               fontSize: 20, fontWeight: FontWeight.bold),
      //     //         ),
      //     //         TextSpan(
      //     //           text: " Naman",
      //     //           style: GoogleFonts.montserrat(
      //     //             fontSize: 14,
      //     //           ),
      //     //         ),
      //     //       ]),
      //     //     ),
      //     //     Spacer(),
      //     //     InkWell(
      //     //       onTap: () {
      //     //         Navigator.pushNamed(context, '/profile_edit');
      //     //       },
      //     //       child: Container(
      //     //         child: CircleAvatar(
      //     //             backgroundColor: Colors.white, child: Text("N")),
      //     //       ),
      //     //     ),
      //     //   ],
      //     // ),
      //   ),
      // ),
      body: SingleChildScrollView(
        controller: scrollcontroller,
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 500,
                viewportFraction: 1,
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 4),
                scrollDirection: Axis.horizontal,
              ),
              items: _discoverMovie.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Stack(
                      children: [
                        SizedBox(
                          width: double.maxFinite,
                          height: 500,
                          child: Image.network(
                            "https://image.tmdb.org/t/p/original${i.posterPath}",
                            fit: BoxFit.cover,
                          ),
                        ),
                        BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                          child: Container(
                            height: 300,
                            color: Colors.transparent,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            "${i.originalTitle}",
                            style: GoogleFonts.montserrat(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    );
                  },
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),
                  TextHeading(heading: "Discover Movies"),
                  const SizedBox(
                    height: 20,
                  ),
                  FutureBuilder(
                    future: fetchmoviedb,
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container(
                          height: 190,
                          width: 125,
                          child:
                              const Center(child: CircularProgressIndicator()),
                        );
                      } else {
                        if (snapshot.hasData) {
                          return Container(
                            height: 190,
                            width: double.maxFinite,
                            child: ListView.separated(
                              itemCount: 10,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, index) {
                                return MovieList(
                                    moviesModel: getMoviesModel
                                        .fromJson(snapshot.data[index]));
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const SizedBox(
                                  width: 10,
                                );
                              },
                            ),
                          );
                        } else {
                          return Container(
                            height: 190,
                            width: 125,
                            child:
                                const Center(child: Text("Some Error Occured")),
                          );
                        }
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextHeading(heading: "You May also Like"),
                  const SizedBox(
                    height: 20,
                  ),
                  FutureBuilder(
                    future: fetchmoviedb,
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container(
                          height: 190,
                          width: 125,
                          child:
                              const Center(child: CircularProgressIndicator()),
                        );
                      } else {
                        if (snapshot.hasData) {
                          return Container(
                            height: 190,
                            width: 125,
                            child: const Center(
                                child: Text("Ml Model Not Implemented Yet")),
                          );
                        } else {
                          return Container(
                            height: 190,
                            width: 125,
                            child:
                                const Center(child: Text("Some Error Occured")),
                          );
                        }
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextHeading(heading: "For You"),
                  const SizedBox(
                    height: 20,
                  ),
                  FutureBuilder(
                    future: fetchmoviedb,
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container(
                          height: 190,
                          width: 125,
                          child:
                              const Center(child: CircularProgressIndicator()),
                        );
                      } else {
                        if (snapshot.hasData) {
                          return Container(
                            height: 190,
                            width: 125,
                            child: const Center(
                                child: Text("Ml Model Not Implemented Yet")),
                          );
                        } else {
                          return Container(
                            height: 190,
                            width: 125,
                            child:
                                const Center(child: Text("Some Error Occured")),
                          );
                        }
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 190,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [Colors.purple, Colors.blue],
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
                                  children: [
                                    Text(
                                      "Find More What You Like",
                                      style: GoogleFonts.montserrat(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                        "Find movies based on your current mood"),
                                  ],
                                ),
                              ),
                              SizedBox(
                                  height: 80,
                                  width: 120,
                                  child: Image.asset(
                                    'assets/images/img_deck.png',
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
                  const SizedBox(
                    height: 20,
                  ),
                  TextHeading(heading: "Popular Movies"),
                  const SizedBox(
                    height: 20,
                  ),
                  FutureBuilder(
                    future: fetchpopularmovie,
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container(
                          height: 190,
                          width: 125,
                          child:
                              const Center(child: CircularProgressIndicator()),
                        );
                      } else {
                        if (snapshot.hasData) {
                          return Container(
                            height: 190,
                            width: double.maxFinite,
                            child: ListView.separated(
                              itemCount: 10,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, index) {
                                return MovieList(
                                    moviesModel: getMoviesModel
                                        .fromJson(snapshot.data[index]));
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const SizedBox(
                                  width: 10,
                                );
                              },
                            ),
                          );
                        } else {
                          return Container(
                            height: 190,
                            width: 125,
                            child:
                                const Center(child: Text("Some Error Occured")),
                          );
                        }
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FutureBuilder(
                    future: fetchscifimovie,
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container(
                          height: 190,
                          width: 125,
                          child:
                              const Center(child: CircularProgressIndicator()),
                        );
                      } else {
                        if (snapshot.hasData) {
                          return Column(
                            children: [
                              TextHeading(
                                heading: "Top SciFi movies",
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                height: 190,
                                width: double.maxFinite,
                                child: ListView.separated(
                                  itemCount: 10,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (BuildContext context, index) {
                                    return MovieList(
                                        moviesModel: getMoviesModel
                                            .fromJson(snapshot.data[index]));
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return const SizedBox(
                                      width: 10,
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Container(
                            height: 190,
                            width: 125,
                            child:
                                const Center(child: Text("Some Error Occured")),
                          );
                        }
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text("Top Genres",
                        style: GoogleFonts.montserrat(
                            fontSize: 17, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FilterRow(count: 10, elements: [
                    "Action",
                    "Adventure",
                    "Thriller",
                    "Horror",
                    "SciFi",
                    "Documentry",
                    "Drama",
                    "Comedy",
                    "Crime",
                    "Romance"
                  ]),
                  const SizedBox(
                    height: 20,
                  ),
                  TextHeading(heading: "Popular Kids Movies"),
                  const SizedBox(
                    height: 20,
                  ),
                  FutureBuilder(
                    future: fetchkidsmovie,
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container(
                          height: 190,
                          width: 125,
                          child:
                              const Center(child: CircularProgressIndicator()),
                        );
                      } else {
                        if (snapshot.hasData) {
                          return Container(
                            height: 190,
                            width: double.maxFinite,
                            child: ListView.separated(
                              itemCount: 10,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, index) {
                                return MovieList(
                                    moviesModel: getMoviesModel
                                        .fromJson(snapshot.data[index]));
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const SizedBox(
                                  width: 10,
                                );
                              },
                            ),
                          );
                        } else {
                          return Container(
                            height: 190,
                            width: 125,
                            child:
                                const Center(child: Text("Some Error Occured")),
                          );
                        }
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextHeading(heading: "Top Rated Movies"),
                  const SizedBox(
                    height: 20,
                  ),
                  FutureBuilder(
                    future: topRatedmovie,
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container(
                          height: 190,
                          width: 125,
                          child:
                              const Center(child: CircularProgressIndicator()),
                        );
                      } else {
                        if (snapshot.hasData) {
                          return Container(
                            height: 190,
                            width: double.maxFinite,
                            child: ListView.separated(
                              itemCount: 10,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, index) {
                                return MovieList(
                                    moviesModel: getMoviesModel
                                        .fromJson(snapshot.data[index]));
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const SizedBox(
                                  width: 10,
                                );
                              },
                            ),
                          );
                        } else {
                          return Container(
                            height: 190,
                            width: 125,
                            child:
                                const Center(child: Text("Some Error Occured")),
                          );
                        }
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextHeading(heading: "Mix of Horror & Comedy"),
                  const SizedBox(
                    height: 20,
                  ),
                  FutureBuilder(
                    future: horrorComedymovie,
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container(
                          height: 190,
                          width: 125,
                          child:
                              const Center(child: CircularProgressIndicator()),
                        );
                      } else {
                        if (snapshot.hasData) {
                          return Container(
                            height: 190,
                            width: double.maxFinite,
                            child: ListView.separated(
                              itemCount: 10,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, index) {
                                return MovieList(
                                    moviesModel: getMoviesModel
                                        .fromJson(snapshot.data[index]));
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const SizedBox(
                                  width: 10,
                                );
                              },
                            ),
                          );
                        } else {
                          return Container(
                            height: 190,
                            width: 125,
                            child:
                                const Center(child: Text("Some Error Occured")),
                          );
                        }
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
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
