import 'dart:ui';

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
        elevation: 0.0,
        // scrolledUnderElevation: true,
        leading: Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: Icon(Icons.person)),
                ],
              ),
            );
          },
        ),
        backgroundColor: Colors.transparent,
        // excludeHeaderSemantics: true,
        title: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Row(
            children: [
              Spacer(),
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/search_screen');
                  },
                  icon: Icon(Icons.search_rounded)),
            ],
          ),
        ),
      ),
      drawer: Drawer(),
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
            Stack(
              children: [
                Image.network(
                  "https://image.tmdb.org/t/p/original/i8dshLvq4LE3s0v8PrkDdUyb1ae.jpg",
                  fit: BoxFit.cover,
                  height: 400,
                  width: double.maxFinite,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      "assets/images/noimage.png",
                      fit: BoxFit.cover,
                    );
                  },
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                  child: Container(
                    height: 300,
                    color: Colors.transparent,
                  ),
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    height: 400,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    scrollDirection: Axis.horizontal,
                  ),
                  items: _discoverMovie.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return InkWell(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.only(top: 80),
                            child: Column(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(16.0),
                                    child: Image.network(
                                      "https://image.tmdb.org/t/p/original${i.posterPath}",
                                      fit: BoxFit.fitWidth,
                                      height: 200,
                                      width: 250,
                                      errorBuilder: (context, error, stackTrace) {
                                        return Image.asset(
                                          "assets/images/noimage.png",
                                          fit: BoxFit.cover,
                                        );
                                      },
                                    )
                                ),
                                // const SizedBox(
                                //   height: 10,
                                // ),
                                // Text(
                                //   "${i.originalTitle}",
                                //   style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.bold),
                                //   overflow: TextOverflow.ellipsis,
                                //   maxLines: 1,
                                //   textAlign: TextAlign.center,
                                // ),
                                // const SizedBox(
                                //   height: 10,
                                // ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ],
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
                          height: 170,
                          width: 125,
                          child:
                              const Center(child: CircularProgressIndicator()),
                        );
                      } else {
                        if (snapshot.hasData) {
                          return Container(
                            height: 170,
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
                                  width: 20,
                                );
                              },
                            ),
                          );
                        } else {
                          return Container(
                            height: 170,
                            width: 125,
                            child:
                                const Center(child: Text("Unavailable Data")),
                          );
                        }
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextHeading(heading: "You may also like"),
                  const SizedBox(
                    height: 20,
                  ),
                  FutureBuilder(
                    future: fetchkidsmovie,
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container(
                          height: 170,
                          width: 125,
                          child:
                              const Center(child: CircularProgressIndicator()),
                        );
                      } else {
                        if (snapshot.hasData) {
                          return Container(
                            height: 170,
                            width: double.maxFinite,
                            child: const Center(
                                child: Text(
                                    "Machine Learning Model Yet to Build")),
                          );
                        } else {
                          return Container(
                            height: 170,
                            width: 125,
                            child:
                                const Center(child: Text("Unavailable Data")),
                          );
                        }
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextHeading(heading: "Suggested For You"),
                  const SizedBox(
                    height: 20,
                  ),
                  FutureBuilder(
                    future: fetchkidsmovie,
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container(
                          height: 170,
                          width: 125,
                          child:
                              const Center(child: CircularProgressIndicator()),
                        );
                      } else {
                        if (snapshot.hasData) {
                          return Container(
                            height: 170,
                            width: double.maxFinite,
                            child: const Center(
                                child: Text(
                                    "Machine Learning Model Yet to Build")),
                          );
                        } else {
                          return Container(
                            height: 170,
                            width: 125,
                            child:
                                const Center(child: Text("Unavailable Data")),
                          );
                        }
                      }
                    },
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
                          height: 170,
                          width: 125,
                          child:
                              const Center(child: CircularProgressIndicator()),
                        );
                      } else {
                        if (snapshot.hasData) {
                          return Container(
                            height: 170,
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
                                  width: 20,
                                );
                              },
                            ),
                          );
                        } else {
                          return Container(
                            height: 170,
                            width: 125,
                            child:
                                const Center(child: Text("Unavailable Data")),
                          );
                        }
                      }
                    },
                  ),
                  // FilterRow(count: 10, elements: [
                  //   "Action",
                  //   "Adventure",
                  //   "Drama",
                  //   "Comedy",
                  //   "Fantasy",
                  //   "Crime",
                  //   "K-Drama",
                  //   "Sports",
                  //   "Fiction",
                  //   "Romance"
                  // ]),
                  const SizedBox(
                    height: 20,
                  ),
                  TextHeading(heading: "Top SciFi Movies"),
                  const SizedBox(
                    height: 20,
                  ),
                  FutureBuilder(
                    future: fetchscifimovie,
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container(
                          height: 170,
                          width: 125,
                          child:
                              const Center(child: CircularProgressIndicator()),
                        );
                      } else {
                        if (snapshot.hasData) {
                          return Container(
                            height: 170,
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
                                  width: 20,
                                );
                              },
                            ),
                          );
                        } else {
                          return Container(
                            height: 170,
                            width: 125,
                            child:
                                const Center(child: Text("Unavailable Data")),
                          );
                        }
                      }
                    },
                  ),
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
                          height: 170,
                          width: 125,
                          child:
                              const Center(child: CircularProgressIndicator()),
                        );
                      } else {
                        if (snapshot.hasData) {
                          return Container(
                            height: 170,
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
                                  width: 20,
                                );
                              },
                            ),
                          );
                        } else {
                          return Container(
                            height: 170,
                            width: 125,
                            child:
                                const Center(child: Text("Unavailable Data")),
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
                          height: 170,
                          width: 125,
                          child:
                              const Center(child: CircularProgressIndicator()),
                        );
                      } else {
                        if (snapshot.hasData) {
                          return Container(
                            height: 170,
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
                                  width: 20,
                                );
                              },
                            ),
                          );
                        } else {
                          return Container(
                            height: 170,
                            width: 125,
                            child:
                                const Center(child: Text("Unavailable Data")),
                          );
                        }
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextHeading(heading: "Mix of Horror and Comedy "),
                  const SizedBox(
                    height: 20,
                  ),
                  FutureBuilder(
                    future: horrorComedymovie,
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container(
                          height: 170,
                          width: 125,
                          child:
                              const Center(child: CircularProgressIndicator()),
                        );
                      } else {
                        if (snapshot.hasData) {
                          return Container(
                            height: 170,
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
                                  width: 20,
                                );
                              },
                            ),
                          );
                        } else {
                          return Container(
                            height: 170,
                            width: 125,
                            child:
                                const Center(child: Text("Unavailable Data")),
                          );
                        }
                      }
                    },
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
