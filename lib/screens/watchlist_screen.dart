import "package:flutter/material.dart";
import 'package:project2/widgets/bottom_bar.dart';
import '../widgets/movie_card.dart';
import 'package:project2/models/apiModels/DiscoverMovieModel.dart';
import 'package:project2/service/apiCall.dart';

class WatchlistScreen extends StatefulWidget {
  const WatchlistScreen({Key? key}) : super(key: key);

  @override
  State<WatchlistScreen> createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen> {
  int screen_index = 3;
  int count = 3;
  Viewtype _viewType = Viewtype.grid;

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

  @override
  Widget build(BuildContext context) {
    return
      DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: const Color(0xFF09090F),
            title: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Text('Watchlist',style: TextStyle(fontSize: 27),),
                  Spacer(),
                  IconButton(
                    icon: Icon(_viewType == Viewtype.list
                        ? Icons.table_rows
                        : Icons.grid_view_rounded),
                    onPressed: () {
                      if (_viewType == Viewtype.list) {
                        _viewType = Viewtype.grid;
                      } else {
                        _viewType = Viewtype.list;
                      }
                      setState(() {});
                    },
                  )

                ],
              ),
            ),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.movie)),
                Tab(icon: Icon(Icons.unarchive)),

              ],
            ),

          ),
          body: TabBarView(
            children: [
              //1
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 20,
                      ),
                  (_viewType == Viewtype.grid)
                      ?
                  ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: 500, minHeight: 56.0),
                    child: ListView.builder(
                      itemCount: content.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                child: Image.network('https://image.tmdb.org/t/p/w600_and_h900_bestv2${content[index].posterPath}'), // Assuming movie poster URL is available in Movie object
                              ),
                              SizedBox(width: 10.0),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      content[index].title,
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                    // Additional movie details can be added here
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )


                        : ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: 500, minHeight: 56.0),
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: content.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                      ),
                      itemBuilder: (context, index) {
                        return MovieCard(movie: content[index]);
                      },
                    ),
                  ),
                    ],
                  ),
                ),
              ),
              Icon(Icons.directions_transit, size: 350),
            ],
          ),
          // bottomNavigationBar: BottomNavigation(
          //   screen_index: 2,
          // ),
        ),

      );


  }
}
enum Viewtype { grid, list }



//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../models/apiModels/DiscoverMovieModel.dart';
// import '../service/apiCall.dart';
// import '../widgets/movie_card.dart';
//
// enum Viewtype { grid, list }
// class WatchlistScreen extends StatefulWidget {
//   const WatchlistScreen({Key? key}) : super(key: key);
//
//   @override
//   State<WatchlistScreen> createState() => _WatchlistScreenState();
// }
//
// class _WatchlistScreenState extends State<WatchlistScreen> {
//   Viewtype _viewType = Viewtype.grid;
//
//   List<DiscoverMovieModel> content = [];
//
//   @override
//   void initState() {
//     super.initState();
//     fetchMovies();
//   }
//
//   Future<void> fetchMovies() async {
//     final response = await discoverMovies();
//     setState(() {
//       content = response;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Movies')),
//       body: GridView.builder(
//         itemCount: content.length,
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2, // Number of columns in the grid
//           crossAxisSpacing: 10.0, // Spacing between columns
//           mainAxisSpacing: 10.0, // Spacing between rows
//         ),
//         itemBuilder: (context, index) {
//           return MovieCard(movie: content[index]);
//         },
//       ),
//     );
//   }
// }
//
