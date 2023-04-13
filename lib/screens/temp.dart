// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import "package:flutter/material.dart";
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:project2/models/mongoDbModels/getMoviesModel.dart';
// import 'package:project2/screens/recommended_movies.dart';
// import 'package:project2/screens/watchlist_screen.dart';
// import 'package:project2/service/mongoDbCall.dart';
// import 'package:project2/widgets/bottom_bar.dart';
// import 'package:project2/widgets/filter_row.dart';
// import 'package:project2/widgets/heading_text.dart';
// import 'package:project2/widgets/movieList.dart';
// import '../widgets/movie_row.dart';
// import 'package:project2/models/apiModels/DiscoverMovieModel.dart';
// import 'package:project2/service/apiCall.dart';
// import 'package:scroll_app_bar/scroll_app_bar.dart';
// import 'package:google_fonts/google_fonts.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

// <<<<<<< HEAD
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   List<DiscoverMovieModel> _discoverMovie = [];
//   var fetchmoviedb;
//   var fetchpopularmovie;
//   var fetchscifimovie;
//   var fetchkidsmovie;

//   @override
//   void initState() {
//     fetchMovies();
//     fetchmoviedb = MongoDatabase.getMovies();
//     fetchpopularmovie = MongoDatabase.getPopularMovies();
//     fetchscifimovie = MongoDatabase.getScifiMovies();
//     fetchkidsmovie = MongoDatabase.getKidsMovies();
//     super.initState();
//   }

//   Future<void> fetchMovies() async {
//     final response1 = await discoverMovies();
//     setState(() {
//       _discoverMovie = response1;
//     });
//   }

//   // final user = FirebaseAuth.instance.currentUser!;
//   int screen_index = 0;
//   final CarouselController carouselController = CarouselController();

//   final scrollcontroller = ScrollController();


//   final items = const [
//     Icon(Icons.people, size: 30,color: Colors.black,),
//     Icon(Icons.person, size: 30,),
//     Icon(Icons.add, size: 30,),
//     Icon(Icons.search_outlined, size: 30,)
//   ];

//   int index = 1;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: CurvedNavigationBar(
//         items: items,
//         index: index,
//         onTap: (selctedIndex){
//           setState(() {
//             index = selctedIndex;
//           });
//         },
//         height: 70,
//         backgroundColor: Colors.transparent,
//         animationDuration: const Duration(milliseconds: 300),
//         // animationCurve: ,
//       ),

//       appBar: ScrollAppBar(
//         controller: scrollcontroller,
//         automaticallyImplyLeading: false,
//         toolbarHeight: 80,
//         backgroundColor: const Color(0xFF09090F),
//         title: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Row(
//             children: [
//               RichText(
//                 text: TextSpan(children: [
//                   TextSpan(
//                     text: "Hello ",
//                     style: GoogleFonts.montserrat(
//                         fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   TextSpan(
//                     text: " Naman",
//                     style: GoogleFonts.montserrat(
//                       fontSize: 14,
//                     ),
//                   ),
//                 ]),
//               ),
//               Spacer(),
//               InkWell(
//                 onTap: () {
//                   Navigator.pushNamed(context, '/profile_edit');
//                 },
//                 child: Container(
//                   child: CircleAvatar(
//                       backgroundColor: Colors.white, child: Text("N")),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         controller: scrollcontroller,
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             children: <Widget>[
//               // SizedBox(
//               //   width: 340,
//               //   height: 60,
//               //   child: TextField(
//               //     readOnly: true,
//               //     onTap: () {
//               //       Navigator.pushNamed(context, '/search_screen');
//               //     },
//               //     textAlignVertical: TextAlignVertical.center,
//               //     decoration: InputDecoration(
//               //         hintText: "Search",
//               //         filled: true,
//               //         fillColor: const Color(0xFF131313),
//               //         border: OutlineInputBorder(
//               //             borderRadius: BorderRadius.circular(16.0),
//               //             borderSide: BorderSide.none),
//               //         prefixIcon: const Icon(Icons.search),
//               //         suffixIcon: const Icon(Icons.filter_alt_outlined),
//               //         suffixIconColor: Colors.white,
//               //         prefixIconColor: Colors.white),
//               //   ),
//               // ),
//               // const SizedBox(
//               //   height: 40,
//               // ),
//               Center(
//                 child: Text(
//                   "Latest Movies",
//                   style: GoogleFonts.montserrat(
//                       fontSize: 22, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               CarouselSlider(
//                 items: _discoverMovie
//                     .map((item) => InkWell(
//                   onTap: () {},
//                   child: Column(
//                     children: [
//                       ClipRRect(
//                           borderRadius: BorderRadius.circular(16.0),
//                           child: Image.network(
//                             "https://image.tmdb.org/t/p/original${item.posterPath}",
//                             fit: BoxFit.cover,
//                             height: 245,
//                             width: 180,
//                             errorBuilder: (context, error, stackTrace) {
//                               return Image.asset(
//                                 "assets/images/noimage.png",
//                                 fit: BoxFit.cover,
//                               );
//                             },
//                           )),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         "${item.originalTitle}",
//                         style: GoogleFonts.montserrat(
//                             fontSize: 14, fontWeight: FontWeight.bold),
//                         overflow: TextOverflow.ellipsis,
//                         maxLines: 1,
//                         textAlign: TextAlign.center,
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                     ],
//                   ),
//                 ))
//                     .toList(),
//                 options: CarouselOptions(
//                   autoPlayInterval: const Duration(seconds: 4),
//                   viewportFraction: 0.55,
//                   height: 375,
//                   autoPlay: true,
//                   aspectRatio: 2.0,
//                   enlargeCenterPage: true,
//                 ),
//               ),
//               TextHeading(heading: "Discover Movies"),
//               const SizedBox(
//                 height: 20,
//               ),
//               FutureBuilder(
//                 future: fetchmoviedb,
//                 builder: (context, AsyncSnapshot snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return Container(
//                       height: 170,
//                       width: 125,
//                       child: const Center(child: CircularProgressIndicator()),
//                     );
//                   } else {
//                     if (snapshot.hasData) {
//                       return Container(
//                         height: 170,
//                         width: double.maxFinite,
//                         child: ListView.separated(
//                           itemCount: 10,
//                           scrollDirection: Axis.horizontal,
//                           itemBuilder: (BuildContext context, index) {
//                             return MovieList(
//                                 moviesModel: getMoviesModel
//                                     .fromJson(snapshot.data[index]));
//                           },
//                           separatorBuilder: (BuildContext context, int index) {
//                             return const SizedBox(
//                               width: 20,
//                             );
//                           },
//                         ),
//                       );
//                     } else {
//                       return Container(
//                         height: 170,
//                         width: 125,
//                         child: const Center(child: Text("Unavailable Data")),
//                       );
//                     }
//                   }
//                 },
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               TextHeading(heading: "Popular Movies"),
//               const SizedBox(
//                 height: 20,
//               ),
//               FutureBuilder(
//                 future: fetchpopularmovie,
//                 builder: (context, AsyncSnapshot snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return Container(
//                       height: 170,
//                       width: 125,
//                       child: const Center(child: CircularProgressIndicator()),
//                     );
//                   } else {
//                     if (snapshot.hasData) {
//                       return Container(
//                         height: 170,
//                         width: double.maxFinite,
//                         child: ListView.separated(
//                           itemCount: 10,
//                           scrollDirection: Axis.horizontal,
//                           itemBuilder: (BuildContext context, index) {
//                             return MovieList(
//                                 moviesModel: getMoviesModel
//                                     .fromJson(snapshot.data[index]));
//                           },
//                           separatorBuilder: (BuildContext context, int index) {
//                             return const SizedBox(
//                               width: 20,
//                             );
//                           },
//                         ),
//                       );
//                     } else {
//                       return Container(
//                         height: 170,
//                         width: 125,
//                         child: const Center(child: Text("Unavailable Data")),
//                       );
//                     }
//                   }
//                 },
//               ),
//               // const SizedBox(
//               //   height: 20,
//               // ),
//               // TextHeading(heading: "Genere"),
//               // const SizedBox(
//               //   height: 20,
//               // ),
//               // FilterRow(count: 10, elements: [
//               //   "Action",
//               //   "Adventure",
//               //   "Drama",
//               //   "Comedy",
//               //   "Fantasy",
//               //   "Crime",
//               //   "K-Drama",
//               //   "Sports",
//               //   "Fiction",
//               //   "Romance"
//               // ]),
//               // const SizedBox(
//               //   height: 20,
//               // ),
//               // TextHeading(heading: "Suggested for you"),
//               // const SizedBox(
//               //   height: 20,
//               // ),
//               // FutureBuilder(
//               //   future: fetchmoviedb,
//               //   builder: (context, AsyncSnapshot snapshot) {
//               //     if (snapshot.connectionState == ConnectionState.waiting) {
//               //       return Container(
//               //         height: 170,
//               //         width: 125,
//               //         child: const Center(child: CircularProgressIndicator()),
//               //       );
//               //     } else {
//               //       if (snapshot.hasData) {
//               //         return Container(
//               //           height: 170,
//               //           width: double.maxFinite,
//               //           child: ListView.separated(
//               //             itemCount: 10,
//               //             scrollDirection: Axis.horizontal,
//               //             itemBuilder: (BuildContext context, index) {
//               //               return MovieList(
//               //                   moviesModel: getMoviesModel
//               //                       .fromJson(snapshot.data[index]));
//               //             },
//               //             separatorBuilder: (BuildContext context, int index) {
//               //               return const SizedBox(
//               //                 width: 20,
//               //               );
//               //             },
//               //           ),
//               //         );
//               //       } else {
//               //         return Container(
//               //           height: 170,
//               //           width: 125,
//               //           child: const Center(child: Text("Unavailable Data")),
//               //         );
//               //       }
//               //     }
//               //   },
//               // ),
//               // const SizedBox(
//               //   height: 20,
//               // ),
//               // TextHeading(heading: "Based on your Recent Searches"),
//               // const SizedBox(
//               //   height: 20,
//               // ),
//               // FutureBuilder(
//               //   future: fetchmoviedb,
//               //   builder: (context, AsyncSnapshot snapshot) {
//               //     if (snapshot.connectionState == ConnectionState.waiting) {
//               //       return Container(
//               //         height: 170,
//               //         width: 125,
//               //         child: const Center(child: CircularProgressIndicator()),
//               //       );
//               //     } else {
//               //       if (snapshot.hasData) {
//               //         return Container(
//               //           height: 170,
//               //           width: double.maxFinite,
//               //           child: ListView.separated(
//               //             itemCount: 10,
//               //             scrollDirection: Axis.horizontal,
//               //             itemBuilder: (BuildContext context, index) {
//               //               return MovieList(
//               //                   moviesModel: getMoviesModel
//               //                       .fromJson(snapshot.data[index]));
//               //             },
//               //             separatorBuilder: (BuildContext context, int index) {
//               //               return const SizedBox(
//               //                 width: 20,
//               //               );
//               //             },
//               //           ),
//               //         );
//               //       } else {
//               //         return Container(
//               //           height: 170,
//               //           width: 125,
//               //           child: const Center(child: Text("Unavailable Data")),
//               //         );
//               //       }
//               //     }
//               //   },
//               // ),
//               // const SizedBox(
//               //   height: 20,
//               // ),
//               // TextHeading(heading: "Languages"),
//               // const SizedBox(
//               //   height: 20,
//               // ),
//               // FilterRow(count: 5, elements: [
//               //   "English",
//               //   "Hindi",
//               //   "Marathi",
//               //   "Japanses",
//               //   "French",
//               // ]),
//               const SizedBox(
//                 height: 20,
//               ),
//               TextHeading(heading: "Top SciFi Movies"),
//               const SizedBox(
//                 height: 20,
//               ),
//               FutureBuilder(
//                 future: fetchscifimovie,
//                 builder: (context, AsyncSnapshot snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return Container(
//                       height: 170,
//                       width: 125,
//                       child: const Center(child: CircularProgressIndicator()),
//                     );
//                   } else {
//                     if (snapshot.hasData) {
//                       return Container(
//                         height: 170,
//                         width: double.maxFinite,
//                         child: ListView.separated(
//                           itemCount: 10,
//                           scrollDirection: Axis.horizontal,
//                           itemBuilder: (BuildContext context, index) {
//                             return MovieList(
//                                 moviesModel: getMoviesModel
//                                     .fromJson(snapshot.data[index]));
//                           },
//                           separatorBuilder: (BuildContext context, int index) {
//                             return const SizedBox(
//                               width: 20,
//                             );
//                           },
//                         ),
//                       );
//                     } else {
//                       return Container(
//                         height: 170,
//                         width: 125,
//                         child: const Center(child: Text("Unavailable Data")),
//                       );
//                     }
//                   }
//                 },
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               TextHeading(heading: "Popular Kids Movies"),
//               const SizedBox(
//                 height: 20,
//               ),
//               FutureBuilder(
//                 future: fetchkidsmovie,
//                 builder: (context, AsyncSnapshot snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return Container(
//                       height: 170,
//                       width: 125,
//                       child: const Center(child: CircularProgressIndicator()),
//                     );
//                   } else {
//                     if (snapshot.hasData) {
//                       return Container(
//                         height: 170,
//                         width: double.maxFinite,
//                         child: ListView.separated(
//                           itemCount: 10,
//                           scrollDirection: Axis.horizontal,
//                           itemBuilder: (BuildContext context, index) {
//                             return MovieList(
//                                 moviesModel: getMoviesModel
//                                     .fromJson(snapshot.data[index]));
//                           },
//                           separatorBuilder: (BuildContext context, int index) {
//                             return const SizedBox(
//                               width: 20,
//                             );
//                           },
//                         ),
//                       );
//                     } else {
//                       return Container(
//                         height: 170,
//                         width: 125,
//                         child: const Center(child: Text("Unavailable Data")),
//                       );
//                     }
//                   }
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//       // bottomNavigationBar: BottomNavigation(
//       //   screen_index: 0,
//       // ),
//     );
//   }
//   Widget getSelectedWidget({required int index}){
//     Widget widget;
//     switch(index){
//       case 0:
//         widget = const RecommendedMovies();
//         break;
//       case 1:
//         widget = const WatchlistScreen();
//         break;
//       default:
//         widget = const HomeScreen();
//         break;
//     }
//     return widget;
//   }

// }


// =======









// // import 'package:flutter/material.dart';
// //
// // import '../service/mongoDbCall.dart';
// //
// // class SearchScreen extends StatefulWidget {
// //   @override
// //   _SearchScreenState createState() => _SearchScreenState();
// // }
// //
// // class _SearchScreenState extends State<SearchScreen> {
// //   String _searchQuery = '';
// //
// //   Future<List<Map<String,dynamic>>> _performSearch(String query) async {
// //     if (query.isEmpty) {
// //       return [];
// //     } else {
// //       final searchResult = await MongoDatabase.searchMovies(query);
// //       return searchResult;
// //     }
// //   }
// //
// //
// //   Widget _buildPopularMoviesListView() {
// //     return FutureBuilder<List<Map<String, dynamic>>>(
// //       future: MongoDatabase.getPopularMovies(),
// //       builder: (context, snapshot) {
// //         if (snapshot.connectionState == ConnectionState.waiting) {
// //           return Center(child: CircularProgressIndicator());
// //         } else if (snapshot.hasError) {
// //           return Center(child: Text('Error: ${snapshot.error}'));
// //         } else {
// //           final popularMovies = snapshot.data;
// //           if (popularMovies == null || popularMovies.isEmpty) {
// //             return Center(child: Text('No popular movies found'));
// //           } else {
// //             return ListView.builder(
// //               itemCount: popularMovies.length,
// //               itemBuilder: (context, index) {
// //                 // Build each popular movie item
// //                 return _buildPopularMovieItem(popularMovies[index]);
// //               },
// //             );
// //           }
// //         }
// //       },
// //     );
// //   }
// //
// //   Widget _buildPopularMovieItem(Map<String, dynamic> popularMovies) {
// //     // Build each popular movie item
// //     // Your code here
// //
// //     return ListView.builder(
// //       itemCount: popularMovies.length,
// //       itemBuilder: (context, index) {
// //         final movie = popularMovies[index];
// //         return Card(
// //           elevation: 4,
// //           margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
// //           color: Color(0xFF09090F),
// //           shape: RoundedRectangleBorder(
// //             borderRadius: BorderRadius.circular(16),
// //           ),
// //           child: Padding(
// //             padding: EdgeInsets.all(16),
// //             child: Row(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 // Movie photo
// //                 Container(
// //                   height: 80,
// //                   width: 80,
// //                   decoration: BoxDecoration(
// //                     borderRadius: BorderRadius.circular(8),
// //                     image: DecorationImage(
// //                       fit: BoxFit.cover,
// //                       image: NetworkImage(
// //                           'https://image.tmdb.org/t/p/original${movie['poster_path']}'),
// //                     ),
// //                   ),
// //                 ),
// //                 SizedBox(width: 16),
// //                 Expanded(
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       // Movie title
// //                       Text(
// //                         movie['title'],
// //                         style: TextStyle(
// //                           fontSize: 18,
// //                           fontWeight: FontWeight.bold,
// //                           color: Colors.white,
// //                         ),
// //                       ),
// //                       SizedBox(height: 8),
// //                       // Movie overview
// //                       Text(
// //                         'Movie overview goes here',
// //                         style: TextStyle(
// //                           fontSize: 14,
// //                           color: Colors.grey,
// //                         ),
// //                         maxLines: 2,
// //                         overflow: TextOverflow.ellipsis,
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }


//   // @override
//   // @override
//   // Widget build(BuildContext context) {
//   //   return Scaffold(
//   //     appBar: AppBar(
//   //       title: Text('Movie Search'),
//   //     ),
//   //     body: Column(
//   //       children: [
//   //         TextField(
//   //           onChanged: (value) {
//   //             setState(() {
//   //               _searchQuery = value;
//   //             });
//   //           },
//   //           onSubmitted: (value) {
//   //             setState(() {
//   //               _searchQuery = value;
//   //             });
//   //           },
//   //           decoration: InputDecoration(
//   //             hintText: 'Search movies...',
//   //             prefixIcon: Icon(Icons.search),
//   //           ),
//   //         ),
//   //         Expanded(
//   //           child: FutureBuilder<List<Map<String, dynamic>>>(
//   //             future:_buildPopularMoviesListView()
//   //             :_performSearch(String query),
//   //             ,
//   //             builder: (context, snapshot) {
//   //               if (snapshot.connectionState == ConnectionState.waiting) {
//   //                 return Center(child: CircularProgressIndicator());
//   //               } else if (snapshot.hasError) {
//   //                 return Center(child: Text('Error: ${snapshot.error}'));
//   //               } else {
//   //                 final searchResults = snapshot.data;
//   //                 if (searchResults == null || searchResults.isEmpty) {
//   //                   return Center(child: Text('No results found'));
//   //                 } else {
//   //                   return ListView.builder(
//   //                     itemCount: searchResults.length,
//   //                     itemBuilder: (context, index) {
//   //                       final movie = searchResults[index];
//   //                       final List<dynamic> genreList = movie['genres'];
//   //                       print(movie['poster_path']);
//   //                       return Card(
//   //                         elevation: 4,
//   //                         margin:
//   //                         EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//   //                         color: Color(0xFF09090F),
//   //                         shape: RoundedRectangleBorder(
//   //                           borderRadius: BorderRadius.circular(16),
//   //                         ),
//   //                         child: Padding(
//   //                           padding: EdgeInsets.all(16),
//   //                           child: Row(
//   //                             crossAxisAlignment: CrossAxisAlignment.start,
//   //                             children: [
//   //                               // Movie photo
//   //                               Container(
//   //                                 height: 80,
//   //                                 width: 80,
//   //                                 decoration: BoxDecoration(
//   //                                   borderRadius: BorderRadius.circular(8),
//   //                                   image: DecorationImage(
//   //                                     fit: BoxFit.cover,
//   //                                     image: NetworkImage(
//   //                                         'https://image.tmdb.org/t/p/original${movie['poster_path']}'),
//   //                                   ),
//   //                                 ),
//   //                               ),
//   //                               SizedBox(width: 16),
//   //                               Expanded(
//   //                                 child: Column(
//   //                                   crossAxisAlignment: CrossAxisAlignment.start,
//   //                                   children: [
//   //                                     // Movie title
//   //                                     Text(
//   //                                       movie['title'],
//   //                                       style: TextStyle(
//   //                                         fontSize: 18,
//   //                                         fontWeight: FontWeight.bold,
//   //                                         color: Colors.white,
//   //                                       ),
//   //                                     ),
//   //                                     SizedBox(height: 8),
//   //                                     // Movie overview
//   //                                     Row(
//   //                                       children: [
//   //                                         Text(
//   //                                           genreList.join("  "),
//   //                                           style: TextStyle(
//   //                                             fontSize: 14,
//   //                                             color: Colors.grey,
//   //                                           ),
//   //                                           maxLines: 2,
//   //                                           overflow: TextOverflow.ellipsis,
//   //                                         ),
//   //                                       ],
//   //                                     ),
//   //                                   ],
//   //                                 ),
//   //                               ),
//   //                             ],
//   //                           ),
//   //                         ),
//   //                       );
//   //                     },
//   //                   );
//   //                 }
//   //               }
//   //             },
//   //           ),
//   //         ),
//           // SizedBox(height: 16),
//           // Text(
//           //   'Popular Movies',
//           //   style: TextStyle(
//           //     fontSize: 18,
//           //     fontWeight: FontWeight.bold,
//           //     color: Colors.white,
//           //   ),
//           // ),
//           // SizedBox(height: 8),
//           // _buildPopularMoviesListView(), // Call the function here
// //         ],
// //       ),
// //     );
// //   }
// //
// // }
// //
// >>>>>>> 2b030e150cb3bc7b421f65802035c8436dfbb8fc
