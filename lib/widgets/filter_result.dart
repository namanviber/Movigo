import 'package:flutter/material.dart';
import 'package:project2/models/getMoviesModel.dart';
import '../models/MovieDetailModel.dart';
import '../screens/home/movieDetail.dart';
import '../service/apiCall.dart';
import '../service/mongoDbCall.dart';
import 'movie_card.dart';

class FilterResults extends StatefulWidget {


  const FilterResults({ Key? key, required String argument}) : super(key: key);

  @override
  State<FilterResults> createState() => _FilterResultsState();
}

class _FilterResultsState extends State<FilterResults> {
  Viewtype _viewType = Viewtype.grid;

  // var filtered_list;
  // var query;
  // List<String > genrelist=['Action','Comedy'];


  Future<List<Map<String, dynamic>>> _performSearch(String q) async {
    try {
      if (q.isEmpty) {
        return [];
      } else {
        final searchResult = await MongoDatabase.searchGenre(q);

        return searchResult;
      }
    } catch (e) {
      return [];
    }
  }


  Future<void> fetchMovieDetails(int movieid) async {
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
    final String query = ModalRoute.of(context)!.settings.arguments as String;
    String _textForFilter;
    return Scaffold(
      appBar:AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
    title: Padding(
    padding: const EdgeInsets.all(16),
    child: Row(
    children: [
    Text(
      query,
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
    ),),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding:
          const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
          child: Column(
            children: <Widget>[
              ConstrainedBox(
                constraints: const BoxConstraints(
                    maxHeight: 700),
                child: FutureBuilder(
                  future: _performSearch(query),
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
                            _textForFilter=content.genres[0];
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
                                          SizedBox(
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
    );
  }
}


enum Viewtype { grid, list }