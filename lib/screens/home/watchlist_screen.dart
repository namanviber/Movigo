import "package:flutter/material.dart";
import 'package:project2/widgets/bottom_bar.dart';
import 'package:project2/widgets/movie_card_watchlist.dart';
import 'package:project2/service/mongoDbCall.dart';
import 'package:project2/models/MovieDetailModel.dart';
import 'package:project2/models/getWatchlistModel.dart';
import 'movieDetail.dart';
import 'package:project2/service/apiCall.dart';

class WatchlistScreen extends StatefulWidget {
  const WatchlistScreen({Key? key}) : super(key: key);

  @override
  State<WatchlistScreen> createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen> {
  Viewtype _viewType = Viewtype.grid;
  var watchlist;
  var watched;

  @override
  void initState() {
    watchlist = MongoDatabase.showWatchlist();
    watched = MongoDatabase.showWatched();
    super.initState();
  }

  Future<void> fetchMovieDetails(int movieid) async {
    final response3 = await movieDetails(movieid);
    late MovieDetailModel movieDetail;
    setState(() {
      movieDetail = response3;
    });
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MovieInfo(
                  movieModel: movieDetail,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Text(
                    'Watchlist',
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(
                      _viewType == Viewtype.list
                          ? Icons.view_agenda
                          : Icons.grid_view_rounded,
                      color: Theme.of(context).iconTheme.color,
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
                  child: Text(
                    "Watched Movies",
                    style: TextStyle(
                      color: Theme.of(context).textTheme.titleMedium!.color,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "Saved Movies",
                  ),
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
                        constraints: BoxConstraints(
                            maxHeight:
                                MediaQuery.of(context).size.height * 0.75,
                            minHeight: 50.0),
                        child: FutureBuilder(
                          future: watchlist,
                          builder: (context, AsyncSnapshot snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else {
                              if (snapshot.hasData) {
                                return (_viewType == Viewtype.grid)
                                    ? ListView.builder(
                                        itemCount: snapshot.data.length,
                                        itemBuilder: (context, index) {
                                          final content = getWatchlistModel
                                              .fromJson(snapshot.data[index]);
                                          return InkWell(
                                            onTap: () {
                                              setState(() {
                                                fetchMovieDetails(content
                                                    .result.first.tmdbId);
                                              });
                                            },
                                            child: Card(
                                              elevation: 4,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 8,
                                                            horizontal: 16),
                                                    child: Row(
                                                      children: [
                                                        SizedBox(
                                                          height: 120,
                                                          width: 100,
                                                          child: Stack(
                                                            children: [
                                                              Image.network(
                                                                'https://image.tmdb.org/t/p/w600_and_h900_bestv2${content.result.first.posterPath}',
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
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
                                                                            .result
                                                                            .first
                                                                            .title,
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              16,
                                                                          color:
                                                                              Theme.of(context).textTheme.titleMedium!.color,
                                                                        )),
                                                                  ),
                                                                  const SizedBox(
                                                                    height:
                                                                        10,
                                                                  ),
                                                                  Text(
                                                                      content
                                                                          .result
                                                                          .first
                                                                          .genres
                                                                          .join(
                                                                              " "),
                                                                      maxLines:
                                                                          2,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
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
                                                                        .delete,
                                                                    color: Theme.of(
                                                                            context)
                                                                        .iconTheme
                                                                        .color,
                                                                    size: 24,
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                        MongoDatabase.removeWatchlist(content.result[0].tmdbId);
                                                                      },
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
                                            final content =
                                                getWatchlistModel.fromJson(
                                                    snapshot.data[index]);
                                            // return Center();
                                            return MovieCardWatch(
                                                movie: content);
                                          },
                                        ),
                                      );
                              } else {
                                print(snapshot.error);
                                return Center(
                                    child: Text(
                                  snapshot.error.toString(),
                                  style: TextStyle(color: Colors.white),
                                ));
                              }
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                  child: Column(
                    children: <Widget>[
                      ConstrainedBox(
                        constraints: BoxConstraints(
                            maxHeight:
                                MediaQuery.of(context).size.height * 0.75,
                            minHeight: 50.0),
                        child: FutureBuilder(
                          future: watchlist,
                          builder: (context, AsyncSnapshot snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else {
                              if (snapshot.hasData) {
                                return (_viewType == Viewtype.grid)
                                    ? ListView.builder(
                                        itemCount: snapshot.data.length,
                                        itemBuilder: (context, index) {
                                          final content = getWatchlistModel
                                              .fromJson(snapshot.data[index]);
                                          return InkWell(
                                            onTap: () {
                                              setState(() {
                                                fetchMovieDetails(content
                                                    .result.first.tmdbId);
                                              });
                                            },
                                            child: Card(
                                              elevation: 4,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 8,
                                                            horizontal: 15),
                                                    child: Row(
                                                      children: [
                                                        SizedBox(
                                                          height: 120,
                                                          width: 100,
                                                          child: Stack(
                                                            children: [
                                                              Image.network(
                                                                'https://image.tmdb.org/t/p/w600_and_h900_bestv2${content.result.first.posterPath}',
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
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
                                                                            .result
                                                                            .first
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
                                                                          .result
                                                                          .first
                                                                          .genres
                                                                          .join(
                                                                              " "),
                                                                      maxLines:
                                                                          2,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
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
                                                                        .delete,
                                                                    color: Theme.of(
                                                                            context)
                                                                        .iconTheme
                                                                        .color,
                                                                    size: 24,
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    MongoDatabase
                                                                        .removeWishlist(
                                                                            862);
                                                                  },
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
                                            final content = getWatchlistModel
                                                .fromJson(snapshot.data[index]);
                                            // return Center();
                                            return MovieCardWatch(
                                                movie: content);
                                          },
                                        ),
                                      );
                              } else {
                                print(snapshot.error);
                                return Center(
                                    child: Text(
                                  snapshot.error.toString(),
                                  style: TextStyle(color: Colors.white),
                                ));
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
