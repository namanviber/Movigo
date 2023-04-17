import "package:flutter/material.dart";
import 'package:project2/widgets/bottom_bar.dart';
import '../../widgets/movie_card.dart';
import 'package:project2/models/apiModels/DiscoverMovieModel.dart';
import 'package:project2/models/mongoDbModels/getMoviesModel.dart';
import 'package:project2/service/apiCall.dart';
import 'package:project2/service/mongoDbCall.dart';

class WatchlistScreen extends StatefulWidget {
  const WatchlistScreen({Key? key}) : super(key: key);

  @override
  State<WatchlistScreen> createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen> {
  Viewtype _viewType = Viewtype.grid;
  var watchlistmovie;
  List<int> specific_user_watched=[8844,9691,11443,117164,9089,11525,46785,12158];
  @override
  void initState() {
    // watchlistmovie = MongoDatabase.userWatchedMovies(8856);
    watchlistmovie = MongoDatabase.userWatchedMovies(specific_user_watched);
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: const Color(0xFF09090F),
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
                                  } else {
                                    if (snapshot.hasData) {
                                      return (_viewType == Viewtype.grid)
                                          ?
                                      ListView.builder(
                                        itemCount: snapshot.data.length,
                                        itemBuilder: (context, index) {
                                          final content=getMoviesModel.fromJson(snapshot.data[index]);
                                          // double popularity = 9;
                                          return Card(
                                            color: Color(0xbb1f1f1f),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        height: 120,
                                                        width: 100,
                                                        child: Stack(
                                                          children: [
                                                            Image.network(
                                                              'https://image.tmdb.org/t/p/w600_and_h900_bestv2${content.posterPath}',
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        // color: Colors.white,
                                                        height: 120,
                                                        width: MediaQuery.of(context).size.width * 0.6,
                                                        child: Stack(
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Align(
                                                                  alignment: Alignment.topLeft,
                                                                  child: Text(
                                                                    content.title,
                                                                    style: TextStyle(fontSize: 16.0),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  content.voteAverage.toString(),
                                                                  style: TextStyle(
                                                                    fontSize: 14,
                                                                  ),
                                                                ),
                                                                Text(
                                                                 content.language,
                                                                  style: TextStyle(
                                                                    fontSize: 12,
                                                                  ),
                                                                ),
                                                                Expanded(child: Container()),
                                                              ],
                                                            ),
                                                            Positioned(
                                                              bottom: 0,
                                                              right: 0,
                                                              child: IconButton(
                                                                icon: Icon(
                                                                  Icons.bookmark,
                                                                  color: Color(0xFF6280CC),
                                                                  size: 24,
                                                                ),
                                                                onPressed: () {},
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
                                          );
                                        },
                                      )
                                      :Padding(

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
                                    final content=getMoviesModel.fromJson(snapshot.data[index]);
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
              Icon(Icons.directions_transit, size: 350),
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
