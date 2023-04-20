import "package:flutter/material.dart";
import 'package:project2/widgets/bottom_bar.dart';
import '../../widgets/movie_card.dart';
import 'package:project2/models/getMoviesModel.dart';
import 'package:project2/service/mongoDbCall.dart';
import 'package:project2/models/MovieDetailModel.dart';
import 'movieDetail.dart';
import 'package:project2/service/apiCall.dart';

class WatchlistScreen extends StatefulWidget {
  const WatchlistScreen({Key? key}) : super(key: key);

  @override
  State<WatchlistScreen> createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen> {
  Viewtype _viewType = Viewtype.grid;
  var watchlistmovie;
  var savedmovie;
  List<int> specific_user_watched = [
    8844,
    9691,
    11443,
    117164,
    9089,
    11525,
    46785,
    12158
  ];
  List<int> specific_user_saved = [
    8844,
    9691,
    11443,
  ];


  List<String > genrelist=['Action','Comedy'];

  @override
  void initState() {
    watchlistmovie = MongoDatabase.userWatchedMovies(specific_user_watched);
    savedmovie = MongoDatabase.userWatchedMovies(specific_user_saved);
    super.initState();
  }

  Future<void> fetchMovieDetails(int movieid) async {
    print(movieid);
    final response3 = await movieDetails(movieid);
    setState(() {
      MovieDetailModel movieDetail = response3;
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MovieInfo(
                    movieModel: movieDetail,
                  )));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            title: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Text(
                    'Watchlist',
                    style: TextStyle(fontSize: 27),
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(
                      _viewType == Viewtype.list
                          ? Icons.table_rows
                          : Icons.grid_view_rounded,
                    ),
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
                Tab(
                  text: "Watched",
                ),
                Tab(
                  text: "Saved",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              //1
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                  child: Column(
                    children: <Widget>[
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                            maxHeight: 550, minHeight: 50.0),
                        child: FutureBuilder(
                          future: watchlistmovie,
                          builder: (context, AsyncSnapshot snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return SizedBox(
                                height: 190,
                                width: 125,
                                child: const Center(
                                    child: CircularProgressIndicator()),
                              );
                            }
                            else {
                              if (snapshot.hasData) {
                                return (_viewType == Viewtype.grid)
                                    ? ListView.builder(
                                        itemCount: snapshot.data.length,
                                        itemBuilder: (context, index) {
                                          final content = getMoviesModel
                                              .fromJson(snapshot.data[index]);
                                          // double popularity = 9;
                                          return InkWell(
                                            onTap: () {
                                              setState(() {
                                                fetchMovieDetails(
                                                    content.tmdbId);
                                              });
                                            },
                                            child: Card(
                                              color: Color(0xbb1f1f1f),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 8,
                                                            horizontal: 15),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          height: 120,
                                                          width: 100,
                                                          child: Stack(
                                                            children: [
                                                              Image.network(
                                                                'https://image.tmdb.org/t/p/w600_and_h900_bestv2${content.posterPath}',
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          height: 120,
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.6,
                                                          child: Stack(
                                                            children: [
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .topLeft,
                                                                    child: Text(
                                                                        content
                                                                            .title,
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              16,
                                                                          color: Theme.of(context)
                                                                              .textTheme
                                                                              .titleMedium!
                                                                              .color,
                                                                        )),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Text(
                                                                      content
                                                                          .genres
                                                                          .join(
                                                                              " "),
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        color: Theme.of(context)
                                                                            .textTheme
                                                                            .titleSmall!
                                                                            .color,
                                                                      )),
                                                                ],
                                                              ),
                                                              Positioned(
                                                                bottom: 0,
                                                                right: 0,
                                                                child:
                                                                    IconButton(
                                                                  icon: Icon(
                                                                    Icons
                                                                        .bookmark,
                                                                    color: Color(
                                                                        0xFF6280CC),
                                                                    size: 24,
                                                                  ),
                                                                  onPressed:
                                                                      () {},
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: GridView.builder(
                                          // shrinkWrap: true,
                                          itemCount: snapshot.data.length,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 10.0,
                                            mainAxisSpacing: 10.0,
                                          ),
                                          itemBuilder: (context, index) {
                                            final content = getMoviesModel
                                                .fromJson(snapshot.data[index]);
                                            // return Center();
                                            return MovieCard(movie: content);
                                          },
                                        ),
                                      );
                              }
                              else {
                                return SizedBox(
                                  height: 190,
                                  width: 125,
                                  child: const Center(
                                      child: Text("Some Error Occured")),
                                );
                              }
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),

              //second tab
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                  child: Column(
                    children: <Widget>[
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                            maxHeight: 550, minHeight: 50.0),
                        child: FutureBuilder(
                          future: savedmovie,
                          builder: (context, AsyncSnapshot snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return SizedBox(
                                height: 190,
                                width: 125,
                                child: const Center(
                                    child: CircularProgressIndicator()),
                              );
                            } else {
                              if (snapshot.hasData) {
                                return (_viewType == Viewtype.grid)
                                    ? ListView.builder(
                                        itemCount: snapshot.data.length,
                                        itemBuilder: (context, index) {
                                          final content = getMoviesModel
                                              .fromJson(snapshot.data[index]);
                                          // double popularity = 9;
                                          return InkWell(
                                            onTap: () {
                                              setState(() {
                                                fetchMovieDetails(
                                                    content.tmdbId);
                                              });
                                            },
                                            child: Card(
                                              color: Color(0xbb1f1f1f),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 8,
                                                            horizontal: 15),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          height: 120,
                                                          width: 100,
                                                          child: Stack(
                                                            children: [
                                                              Image.network(
                                                                'https://image.tmdb.org/t/p/w600_and_h900_bestv2${content.posterPath}',
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          height: 120,
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.6,
                                                          child: Stack(
                                                            children: [
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .topLeft,
                                                                    child: Text(
                                                                        content
                                                                            .title,
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              16,
                                                                          color: Theme.of(context)
                                                                              .textTheme
                                                                              .titleMedium!
                                                                              .color,
                                                                        )),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Text(
                                                                      content
                                                                          .genres
                                                                          .join(
                                                                              " "),
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        color: Theme.of(context)
                                                                            .textTheme
                                                                            .titleSmall!
                                                                            .color,
                                                                      )),
                                                                ],
                                                              ),
                                                              Positioned(
                                                                bottom: 0,
                                                                right: 0,
                                                                child:
                                                                    IconButton(
                                                                  icon: Icon(
                                                                    Icons
                                                                        .bookmark,
                                                                    color: Color(
                                                                        0xFF6280CC),
                                                                    size: 24,
                                                                  ),
                                                                  onPressed:
                                                                      () {},
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: GridView.builder(
                                          // shrinkWrap: true,
                                          itemCount: snapshot.data.length,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 10.0,
                                            mainAxisSpacing: 10.0,
                                          ),
                                          itemBuilder: (context, index) {
                                            final content = getMoviesModel
                                                .fromJson(snapshot.data[index]);
                                            // return Center();
                                            return MovieCard(movie: content);
                                          },
                                        ),
                                      );
                              } else {
                                return SizedBox(
                                  height: 190,
                                  width: 125,
                                  child: const Center(
                                      child: Text("Some Error Occured")),
                                );
                              }
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        screen_index: 2,
      ),
    );
  }
}

enum Viewtype { grid, list }
