import 'package:flutter/material.dart';
import 'package:project2/models/getMoviesModel.dart';
import 'package:project2/service/apiCall.dart';
import 'package:project2/models/MovieDetailModel.dart';
import 'package:project2/screens/home/movieDetail.dart';
import 'movie_card.dart';

class ItemGrid extends StatefulWidget {
  String heading;
  var movies;
  ItemGrid({required this.heading, required this.movies, Key? key})
      : super(key: key);

  @override
  State<ItemGrid> createState() => _ItemGridState();
}

class _ItemGridState extends State<ItemGrid> {
  bool state = true;

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Row(
          children: [
            Spacer(),
            Text(widget.heading),
            Spacer(),
            IconButton(
              icon: Icon(
                (state) ? Icons.view_agenda : Icons.grid_view_rounded,
              ),
              onPressed: () {
                setState(() {
                  state = !state;
                });
              },
            )
          ],
        ),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.9,
            minHeight: 50.0),
        child: FutureBuilder(
          future: widget.movies,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator( color: Theme.of(context).primaryColor,));
            } else {
              if (snapshot.hasData) {
                return (state)
                    ? ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          final content =
                              getMoviesModel.fromJson(snapshot.data[index]);
                          return InkWell(
                            onTap: () {
                              setState(() {
                                fetchMovieDetails(content.tmdbId);
                              });
                            },
                            child: Card(
                              color: Theme.of(context).cardColor,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 15),
                                    child: Row(
                                      children: [
                                        SizedBox(
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
                                        SizedBox(
                                          height: 120,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.6,
                                          child: Stack(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Text(content.title,
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          color:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .titleMedium!
                                                                  .color,
                                                        )),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(content.genres.join(" "),
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: Theme.of(context)
                                                            .textTheme
                                                            .titleSmall!
                                                            .color,
                                                      )),
                                                ],
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
                                getMoviesModel.fromJson(snapshot.data[index]);
                            // return Center();
                            return MovieCard(movie: content);
                          },
                        ),
                      );
              } else {
                return SizedBox(
                  height: 190,
                  width: 125,
                  child: const Center(child: Text("Some Error Occured")),
                );
              }
            }
          },
        ),
      ),
    );
  }
}
