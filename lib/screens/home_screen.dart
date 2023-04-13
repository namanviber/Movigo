import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:carousel_slider/carousel_slider.dart';
import 'package:project2/models/mongoDbModels/getMoviesModel.dart';
import 'package:project2/service/mongoDbCall.dart';
import 'package:project2/widgets/bottom_bar.dart';
import 'package:project2/widgets/filter_row.dart';
import 'package:project2/widgets/heading_text.dart';
import 'package:project2/widgets/movieList.dart';
import '../widgets/movie_row.dart';
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
      appBar: ScrollAppBar(
        controller: scrollcontroller,
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        backgroundColor: const Color(0xFF09090F),
        title: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: "Hello ",
                    style: GoogleFonts.montserrat(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: " Naman",
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                    ),
                  ),
                ]),
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/profile_edit');
                },
                child: Container(
                  child: CircleAvatar(
                      backgroundColor: Colors.white, child: Text("N")),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: scrollcontroller,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              // SizedBox(
              //   width: 340,
              //   height: 60,
              //   child: TextField(
              //     readOnly: true,
              //     onTap: () {
              //       Navigator.pushNamed(context, '/search_screen');
              //     },
              //     textAlignVertical: TextAlignVertical.center,
              //     decoration: InputDecoration(
              //         hintText: "Search",
              //         filled: true,
              //         fillColor: const Color(0xFF131313),
              //         border: OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(16.0),
              //             borderSide: BorderSide.none),
              //         prefixIcon: const Icon(Icons.search),
              //         suffixIcon: const Icon(Icons.filter_alt_outlined),
              //         suffixIconColor: Colors.white,
              //         prefixIconColor: Colors.white),
              //   ),
              // ),
              // const SizedBox(
              //   height: 40,
              // ),
              Center(
                child: Text(
                  "Latest Movies",
                  style: GoogleFonts.montserrat(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
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
                                height: 10,
                              ),
                              Text(
                                "${item.originalTitle}",
                                style: GoogleFonts.montserrat(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ))
                    .toList(),
                options: CarouselOptions(
                  autoPlayInterval: const Duration(seconds: 4),
                  viewportFraction: 0.55,
                  height: 375,
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                ),
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
                      child: const Center(child: CircularProgressIndicator()),
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
                          separatorBuilder: (BuildContext context, int index) {
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
                        child: const Center(child: Text("Unavailable Data")),
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
                      child: const Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    if (snapshot.hasData) {
                      return Container(
                        height: 170,
                        width: double.maxFinite,
                        child: const Center(
                            child: Text("Machine Learning Model Yet to Build")),
                      );
                    } else {
                      return Container(
                        height: 170,
                        width: 125,
                        child: const Center(child: Text("Unavailable Data")),
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
                      child: const Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    if (snapshot.hasData) {
                      return Container(
                        height: 170,
                        width: double.maxFinite,
                        child: const Center(
                            child: Text("Machine Learning Model Yet to Build")),
                      );
                    } else {
                      return Container(
                        height: 170,
                        width: 125,
                        child: const Center(child: Text("Unavailable Data")),
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
                      child: const Center(child: CircularProgressIndicator()),
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
                          separatorBuilder: (BuildContext context, int index) {
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
                        child: const Center(child: Text("Unavailable Data")),
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
                      child: const Center(child: CircularProgressIndicator()),
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
                          separatorBuilder: (BuildContext context, int index) {
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
                        child: const Center(child: Text("Unavailable Data")),
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
                      child: const Center(child: CircularProgressIndicator()),
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
                          separatorBuilder: (BuildContext context, int index) {
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
                        child: const Center(child: Text("Unavailable Data")),
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
                      child: const Center(child: CircularProgressIndicator()),
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
                          separatorBuilder: (BuildContext context, int index) {
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
                        child: const Center(child: Text("Unavailable Data")),
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
                      child: const Center(child: CircularProgressIndicator()),
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
                          separatorBuilder: (BuildContext context, int index) {
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
                        child: const Center(child: Text("Unavailable Data")),
                      );
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigation(
      //   screen_index: 0,
      // ),
    );
  }
}
