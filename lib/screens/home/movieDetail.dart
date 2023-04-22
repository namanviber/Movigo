import 'package:flutter/material.dart';
import 'package:project2/models/MovieDetailModel.dart';
import 'package:project2/models/MovieCastDetailsModel.dart';
import 'package:project2/models/MovieCrewDetailsModel.dart';
import 'package:project2/models/getWatchlistModel.dart';
import 'package:project2/service/apiCall.dart';
import 'package:project2/widgets/heading_text.dart';
import 'package:project2/service/mongoDbCall.dart';
import 'package:project2/widgets/movie_cast_row.dart';
import 'package:project2/widgets/movie_crew_row.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MovieInfo extends StatefulWidget {
  final MovieDetailModel movieModel;
  const MovieInfo({required this.movieModel, Key? key}) : super(key: key);

  @override
  State<MovieInfo> createState() => _MovieInfoState();
}

class _MovieInfoState extends State<MovieInfo> {
  List<MovieCastDetailsModel> _movieCast = [];
  List<MovieCrewDetailsModel> _movieCrew = [];

  Future<void> fetchCreditDetails(int movieid) async {
    final response1 = await movieCastDetails(movieid);
    final response2 = await movieCrewDetails(movieid);
    setState(() {
      _movieCast = response1;
      _movieCrew = response2;
    });
  }

  @override
  void initState() {
    fetchCreditDetails(widget.movieModel.id);
    super.initState();
  }

  bool watched = false;

  Widget build(BuildContext context) {
    final backdropposterUrl =
        'https://image.tmdb.org/t/p/original/${widget.movieModel.backdropPath}';

    final originalTitle = "${widget.movieModel.originalTitle}";

    TextEditingController length =
        TextEditingController(text: "${widget.movieModel.runtime} minutes");

    TextEditingController language =
        TextEditingController(text: "${widget.movieModel.originalLanguage}");

    TextEditingController rating =
        TextEditingController(text: "${widget.movieModel.voteAverage}");

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20,
                    child: Text("7.6"),
                  ),
                  Image(
                    image: backdropposterUrl != ''
                        ? NetworkImage(
                            backdropposterUrl,
                          )
                        : const AssetImage('assets/images/noimage.png')
                            as ImageProvider,
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        originalTitle,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.titleLarge!.color,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "genres",
                        style: TextStyle(
                          fontSize: 11,
                          color: Theme.of(context).textTheme.titleLarge!.color,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 100,
                          child: TextField(
                            controller: length,
                            readOnly: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              label: Text(
                                "Length",
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .color,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 100,
                          child: TextField(
                            controller: language,
                            readOnly: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              label: Text(
                                "Language",
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .color,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 50,
                          child: TextField(
                            controller: rating,
                            readOnly: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              label: Text(
                                "Rating",
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .color,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      style: Theme.of(context).filledButtonTheme.style,
                      onPressed: () {
                        setState(() {
                          MongoDatabase.addWatched(widget.movieModel.id);

                          watched = !watched;
                        });
                      },
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: (watched)
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Watched",
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .color,
                                    ),
                                  ),
                                  Icon(
                                    Icons.check,
                                    color: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .color,
                                  )
                                ],
                              )
                            : Center(
                                child: Text(
                                  "Not Watched Yet",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .color,
                                  ),
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {
                            MongoDatabase.addWatchlist(widget.movieModel.id);
                          },
                          icon: FaIcon(
                            FontAwesomeIcons.bookmark,
                            color: Colors.white,
                          ),
                          selectedIcon: FaIcon(
                            FontAwesomeIcons.solidBookmark,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              MongoDatabase.addRating(widget.movieModel.id, 4.5);
                            },
                            icon: FaIcon(
                              FontAwesomeIcons.star,
                              color: Colors.white,
                            )),
                        IconButton(
                            onPressed: () {
                            },
                            icon: FaIcon(
                              FontAwesomeIcons.share,
                              color: Colors.white,
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "${widget.movieModel.overview}",
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).textTheme.titleLarge!.color,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Text(
                          "Cast",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color:
                                Theme.of(context).textTheme.titleLarge!.color,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 215,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.separated(
                            itemCount: _movieCast.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, index) {
                              final cast = _movieCast[index];
                              return MovieCastRow(model: cast);
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(
                                width: 20,
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Crew",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color:
                                Theme.of(context).textTheme.titleLarge!.color,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 215,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.separated(
                            itemCount: _movieCrew.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, index) {
                              final crew = _movieCrew[index];
                              return MovieCrewRow(model: crew);
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(
                                width: 20,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
