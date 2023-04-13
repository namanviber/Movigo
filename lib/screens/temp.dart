// // import 'package:flutter/material.dart';
// //
// // void main() {
// //   runApp(const MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});
// //
// //   // This widget is the root of your application.
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Flutter Demo',
// //       theme: ThemeData(
// //
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: const MyHomePage(title: 'Flutter Demo Home Page'),
// //     );
// //   }
// // }
// //
// // class MyHomePage extends StatefulWidget {
// //   const MyHomePage({super.key, required this.title});
// //   final String title;
// //
// //   @override
// //   State<MyHomePage> createState() => _MyHomePageState();
// // }
// //
// // class _MyHomePageState extends State<MyHomePage> {
// //
// //
// //   @override
// //   Widget build(BuildContext context) {
// //
// //     return Scaffold(
// //       appBar: AppBar(
// //
// //         title: Text(widget.title),
// //       ),
// //       body: Center(
// //
// //
// //     )
// //     );
// //   }
// // }
//
// import 'package:project2/models/search_screen_model_services.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:project2/models/SearchModel.dart';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: SearchScreen(),
//     );
//   }
// }
//
// class SearchScreen extends StatefulWidget {
//   const SearchScreen({super.key});
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//   // This class is the configuration for the state.
//   @override
//   _SearchScreenState createState() => _SearchScreenState();
// }
//
// class _SearchScreenState extends State<SearchScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       backgroundColor: Colors.black,
//       body: Column(
//         children: [
//           SizedBox(height: 80,),
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(children: [
//               Container(
//                 width: 370,
//                 child: TextField(
//
//
//                   style: TextStyle(color: Colors.white),
//                   cursorColor: Colors.white,
//                   // onChanged: (value) => _runFilter(value),
//                   decoration: InputDecoration(
//
//                     contentPadding: const EdgeInsets.symmetric(
//                         vertical: 10.0, horizontal: 15),
//                     hintText: "Search",
//                     hintStyle: TextStyle(color: Colors.white),
//
//                     suffixIcon: const Icon(Icons.search),suffixIconColor: Colors.white,
//                     // prefix: Icon(Icons.search),
//                     focusedBorder: OutlineInputBorder(
//
//                       borderRadius: BorderRadius.circular(20.0),
//                       borderSide: BorderSide(color: Colors.white
//                       ),
//
//
//                     ),
//                   ),
//                 ),
//               ),
//             ]),
//           ),
//           Expanded(
//             child: Container(
//               child: createGrid(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget createItem(SearchModel model) {
//     return Container(
//       color: Colors.black54,
//       height: 300,
//       child: Column(
//         children: [
//           Container(
//               height: 250,
//               child: Image.asset(
//                 'assets/images/q.jpg',
//               )),
//           Container(
//             // color: Colors.white,
//               width: 140,
//               margin: EdgeInsets.only(bottom: 10),
//               child: Text(model.name,
//                   style: GoogleFonts.poppins(
//                     textStyle: TextStyle(
//                         color: Colors.white, fontWeight: FontWeight.w400),
//                   ))),
//           Container(
//               width: 140,
//               child: Row(
//                 children: [
//                   Text(
//                     model.rating,
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   SizedBox(
//                     width: 100,
//                   ),
//                   Text(
//                     model.rating,
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ],
//               ))
//         ],
//       ),
//     );
//   }
//
//   List<Widget> createListOfModel() {
//     List<SearchModel> search_list = search_screen_model_services.getResult(); // receive data
//     //convert data to widgte using map funciton
//     List<Widget> list =
//     search_list.map((SearchModel model) => createItem(model)).toList();
//     return list;
//   }
//
//   Widget createGrid() {
//     return GridView.count(
//       crossAxisCount: 2,
//       crossAxisSpacing: 10,
//       mainAxisSpacing: 10,
//       childAspectRatio: 0.6,
//       children: createListOfModel(),
//     );
//   }
// }











// import 'package:flutter/material.dart';
//
// import '../service/mongoDbCall.dart';
//
// class SearchScreen extends StatefulWidget {
//   @override
//   _SearchScreenState createState() => _SearchScreenState();
// }
//
// class _SearchScreenState extends State<SearchScreen> {
//   String _searchQuery = '';
//
//   Future<List<Map<String,dynamic>>> _performSearch(String query) async {
//     if (query.isEmpty) {
//       return [];
//     } else {
//       final searchResult = await MongoDatabase.searchMovies(query);
//       return searchResult;
//     }
//   }
//
//
//   Widget _buildPopularMoviesListView() {
//     return FutureBuilder<List<Map<String, dynamic>>>(
//       future: MongoDatabase.getPopularMovies(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Center(child: Text('Error: ${snapshot.error}'));
//         } else {
//           final popularMovies = snapshot.data;
//           if (popularMovies == null || popularMovies.isEmpty) {
//             return Center(child: Text('No popular movies found'));
//           } else {
//             return ListView.builder(
//               itemCount: popularMovies.length,
//               itemBuilder: (context, index) {
//                 // Build each popular movie item
//                 return _buildPopularMovieItem(popularMovies[index]);
//               },
//             );
//           }
//         }
//       },
//     );
//   }
//
//   Widget _buildPopularMovieItem(Map<String, dynamic> popularMovies) {
//     // Build each popular movie item
//     // Your code here
//
//     return ListView.builder(
//       itemCount: popularMovies.length,
//       itemBuilder: (context, index) {
//         final movie = popularMovies[index];
//         return Card(
//           elevation: 4,
//           margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//           color: Color(0xFF09090F),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(16),
//           ),
//           child: Padding(
//             padding: EdgeInsets.all(16),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Movie photo
//                 Container(
//                   height: 80,
//                   width: 80,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                     image: DecorationImage(
//                       fit: BoxFit.cover,
//                       image: NetworkImage(
//                           'https://image.tmdb.org/t/p/original${movie['poster_path']}'),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 16),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Movie title
//                       Text(
//                         movie['title'],
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                       SizedBox(height: 8),
//                       // Movie overview
//                       Text(
//                         'Movie overview goes here',
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.grey,
//                         ),
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }


  // @override
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('Movie Search'),
  //     ),
  //     body: Column(
  //       children: [
  //         TextField(
  //           onChanged: (value) {
  //             setState(() {
  //               _searchQuery = value;
  //             });
  //           },
  //           onSubmitted: (value) {
  //             setState(() {
  //               _searchQuery = value;
  //             });
  //           },
  //           decoration: InputDecoration(
  //             hintText: 'Search movies...',
  //             prefixIcon: Icon(Icons.search),
  //           ),
  //         ),
  //         Expanded(
  //           child: FutureBuilder<List<Map<String, dynamic>>>(
  //             future:_buildPopularMoviesListView()
  //             :_performSearch(String query),
  //             ,
  //             builder: (context, snapshot) {
  //               if (snapshot.connectionState == ConnectionState.waiting) {
  //                 return Center(child: CircularProgressIndicator());
  //               } else if (snapshot.hasError) {
  //                 return Center(child: Text('Error: ${snapshot.error}'));
  //               } else {
  //                 final searchResults = snapshot.data;
  //                 if (searchResults == null || searchResults.isEmpty) {
  //                   return Center(child: Text('No results found'));
  //                 } else {
  //                   return ListView.builder(
  //                     itemCount: searchResults.length,
  //                     itemBuilder: (context, index) {
  //                       final movie = searchResults[index];
  //                       final List<dynamic> genreList = movie['genres'];
  //                       print(movie['poster_path']);
  //                       return Card(
  //                         elevation: 4,
  //                         margin:
  //                         EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  //                         color: Color(0xFF09090F),
  //                         shape: RoundedRectangleBorder(
  //                           borderRadius: BorderRadius.circular(16),
  //                         ),
  //                         child: Padding(
  //                           padding: EdgeInsets.all(16),
  //                           child: Row(
  //                             crossAxisAlignment: CrossAxisAlignment.start,
  //                             children: [
  //                               // Movie photo
  //                               Container(
  //                                 height: 80,
  //                                 width: 80,
  //                                 decoration: BoxDecoration(
  //                                   borderRadius: BorderRadius.circular(8),
  //                                   image: DecorationImage(
  //                                     fit: BoxFit.cover,
  //                                     image: NetworkImage(
  //                                         'https://image.tmdb.org/t/p/original${movie['poster_path']}'),
  //                                   ),
  //                                 ),
  //                               ),
  //                               SizedBox(width: 16),
  //                               Expanded(
  //                                 child: Column(
  //                                   crossAxisAlignment: CrossAxisAlignment.start,
  //                                   children: [
  //                                     // Movie title
  //                                     Text(
  //                                       movie['title'],
  //                                       style: TextStyle(
  //                                         fontSize: 18,
  //                                         fontWeight: FontWeight.bold,
  //                                         color: Colors.white,
  //                                       ),
  //                                     ),
  //                                     SizedBox(height: 8),
  //                                     // Movie overview
  //                                     Row(
  //                                       children: [
  //                                         Text(
  //                                           genreList.join("  "),
  //                                           style: TextStyle(
  //                                             fontSize: 14,
  //                                             color: Colors.grey,
  //                                           ),
  //                                           maxLines: 2,
  //                                           overflow: TextOverflow.ellipsis,
  //                                         ),
  //                                       ],
  //                                     ),
  //                                   ],
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                       );
  //                     },
  //                   );
  //                 }
  //               }
  //             },
  //           ),
  //         ),
          // SizedBox(height: 16),
          // Text(
          //   'Popular Movies',
          //   style: TextStyle(
          //     fontSize: 18,
          //     fontWeight: FontWeight.bold,
          //     color: Colors.white,
          //   ),
          // ),
          // SizedBox(height: 8),
          // _buildPopularMoviesListView(), // Call the function here
//         ],
//       ),
//     );
//   }
//
// }
//
