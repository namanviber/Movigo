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
  var fetchmoviedb;
  var fetchpopularmovie;
  var fetchscifimovie;

  @override
  void initState() {
    fetchmoviedb = MongoDatabase.getMovies();
    fetchpopularmovie = MongoDatabase.getPopularMovies();
    fetchscifimovie = MongoDatabase.getScifiMovies();
    super.initState();
  }

  final user = FirebaseAuth.instance.currentUser!;
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            InkWell(
              onTap: () {
                FirebaseAuth.instance.signOut();
              },
              child: Container(
                child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: SizedBox(
                        width: 60,
                        height: 60,
                        child: ClipOval(
                          child: Image.network(
                            "",
                            fit: BoxFit.cover,
                            height: 170,
                            width: 125,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                "assets/images/noimage.png",
                                fit: BoxFit.cover,
                              );
                            },
                          ),
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
                  readOnly: true,
                  onTap: () {
                    Navigator.pushNamed(context, '/search_screen');
                  },
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
              // FutureBuilder(
              //   future: fetchmoviedb,
              //   builder: (context, AsyncSnapshot snapshot) {
              //     if (snapshot.connectionState == ConnectionState.waiting) {
              //       return Container(
              //         height: 170,
              //         width: 125,
              //         child: const Center(child: CircularProgressIndicator()),
              //       );
              //     } else {
              //       if (snapshot.hasData) {
              //         List posterpath = <String>[];
              //         // List<List<String>> movies = [[]];
              //         var j = snapshot.data.length;
              //         var i = 0;
              //         while (i < j){
              //           posterpath.add(snapshot.data[i]['poster_path']);
              //           print(posterpath[i]);
              //           // movies[0][i] = snapshot.data[i]['poster_path'];
              //           // movies[1][i] = snapshot.data[i]['title'];
              //           // print(movies[0][i]);
              //           i++;
              //         }
              //         return CarouselSlider(
              //           items: posterpath
              //               .map((item) => InkWell(
              //             onTap: () {},
              //             child: Column(
              //               children: [
              //                 ClipRRect(
              //                     borderRadius: BorderRadius.circular(16.0),
              //                     child: Image.network(
              //                       "https://image.tmdb.org/t/p/original${item}",
              //                       fit: BoxFit.cover,
              //                       height: 245,
              //                       width: 180,
              //                       errorBuilder: (context, error, stackTrace) {
              //                         return Image.asset(
              //                           "assets/images/noimage.png",
              //                           fit: BoxFit.cover,
              //                         );
              //                       },
              //                     )),
              //                 const SizedBox(
              //                   height: 10,
              //                 ),
              //                 Text(
              //                   "Text",
              //                   style: GoogleFonts.montserrat(
              //                       fontSize: 14, fontWeight: FontWeight.bold),
              //                   overflow: TextOverflow.ellipsis,
              //                   maxLines: 1,
              //                   textAlign: TextAlign.center,
              //                 ),
              //                 const SizedBox(
              //                   height: 10,
              //                 ),
              //                 Row(
              //                   mainAxisAlignment: MainAxisAlignment.center,
              //                   children: [
              //                     Container(
              //                       height: 20,
              //                       width: 40,
              //                       decoration: BoxDecoration(
              //                           color: const Color(0xff51535E),
              //                           borderRadius: BorderRadius.circular(5)),
              //                       child: Center(
              //                         child: Text(
              //                           "18+",
              //                           style: GoogleFonts.montserrat(
              //                               fontSize: 13,
              //                               fontWeight: FontWeight.w600),
              //                         ),
              //                       ),
              //                     ),
              //                     const SizedBox(
              //                       width: 10,
              //                     ),
              //                     Container(
              //                       height: 22,
              //                       width: 60,
              //                       decoration: BoxDecoration(
              //                           color: const Color(0xff51535E),
              //                           borderRadius: BorderRadius.circular(5)),
              //                       child: Center(
              //                         child: Text(
              //                           "Action",
              //                           style: GoogleFonts.montserrat(
              //                               fontSize: 13,
              //                               fontWeight: FontWeight.w600),
              //                         ),
              //                       ),
              //                     ),
              //                     const SizedBox(
              //                       width: 10,
              //                     ),
              //                     Container(
              //                       height: 22,
              //                       width: 40,
              //                       decoration: BoxDecoration(
              //                           color: const Color(0xff51535E),
              //                           borderRadius: BorderRadius.circular(5)),
              //                       child: Center(
              //                         child: Text(
              //                           "en",
              //                           style: GoogleFonts.montserrat(
              //                               fontSize: 13,
              //                               fontWeight: FontWeight.w600),
              //                         ),
              //                       ),
              //                     ),
              //                   ],
              //                 )
              //               ],
              //             ),
              //           ))
              //               .toList(),
              //           options: CarouselOptions(
              //             autoPlayInterval: const Duration(seconds: 2),
              //             viewportFraction: 0.55,
              //             height: 405,
              //             autoPlay: true,
              //             aspectRatio: 2.0,
              //             enlargeCenterPage: true,
              //           ),
              //         );
              //       } else {
              //         return Container(
              //           height: 170,
              //           width: 125,
              //           child: const Center(child: Text("Unavailable Data")),
              //         );
              //       }
              //     }
              //   },
              // ),
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
              TextHeading(heading: "Based on your Recent Searches"),
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
