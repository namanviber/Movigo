import "package:flutter/material.dart";
import 'package:project2/widgets/bottom_bar.dart';
import '../../widgets/movie_card.dart';
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
    return DefaultTabController(
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
              Tab(text: "Watched Movies",),
              Tab(text: "Unwatched Movies",),
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
                    SizedBox(
                      height: 450,
                      width: double.maxFinite,
                      child: ListView.builder(
                        itemCount: content.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, index) {
                          final movie = content[index];
                          return (_viewType == Viewtype.list)
                              ? SizedBox(
                                  height: 450,
                                  child: Center(
                                    child: Container(
                                      padding: EdgeInsets.all(11),
                                      child: GridView.builder(
                                        gridDelegate:
                                            SliverGridDelegateWithMaxCrossAxisExtent(
                                          maxCrossAxisExtent: 110,
                                          mainAxisExtent: 150,
                                          mainAxisSpacing: 11,
                                          crossAxisSpacing: 11,
                                        ),
                                        itemBuilder: (context, index) {
                                          return Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/img_3.png'),
                                                  fit: BoxFit.fill),
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                )
                              : SizedBox(
                                  height: 450,
                                  width: double.maxFinite,
                                  child: ListView.builder(
                                    itemCount: content.length,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (BuildContext context, index) {
                                      final movie = content[index];
                                      return MovieCard(movie: movie);
                                    },
                                  ),
                                );
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
        bottomNavigationBar: BottomNavigation(
          screen_index: 2,
        ),
      ),
    );
  }
}

enum Viewtype { grid, list }
