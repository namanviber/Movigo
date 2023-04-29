import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:project2/models/MovieDetailModel.dart';
import 'package:project2/models/MovieCastDetailsModel.dart';
import 'package:project2/models/MovieCrewDetailsModel.dart';
import 'package:project2/service/apiCall.dart';
import 'package:project2/service/mongoDbCall.dart';
import 'package:project2/widgets/movie_cast_row.dart';
import 'package:project2/widgets/movie_crew_row.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project2/utilities/ratings_auth.dart';

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

    var dateinit = DateTime.parse("${widget.movieModel.releaseDate}");
    var formattedDate = "${dateinit.day}-${dateinit.month}-${dateinit.year}";

    TextEditingController date = TextEditingController(text: "$formattedDate");

    TextEditingController length =
        TextEditingController(text: "${widget.movieModel.runtime} mins");

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
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: Image(
                      image: backdropposterUrl != ''
                          ? NetworkImage(
                              backdropposterUrl,
                            )
                          : const AssetImage('assets/images/noimage.png')
                              as ImageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.space,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Text(
                              originalTitle,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .color,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              LikeButton(
                                likeBuilder: (isliked) {
                                  return Icon(
                                    Icons.bookmark_add,
                                    color: isliked
                                        ? Theme.of(context).iconTheme.color!
                                        : Theme.of(context).canvasColor,
                                  );
                                },
                                onTap: (isLiked) async {
                                  MongoDatabase.addWatchlist(
                                      widget.movieModel.id);
                                  return !isLiked;
                                },
                              ),
                              LikeButton(
                                likeBuilder: (isliked) {
                                  return Icon(
                                    Icons.screen_share,
                                    color: isliked
                                        ? Theme.of(context).iconTheme.color!
                                        : Theme.of(context).canvasColor,
                                  );
                                },
                                onTap: (isLiked) async {
                                  MongoDatabase.addWatched(widget.movieModel.id);
                                  return !isLiked;
                                },
                              ),
                              LikeButton(
                                likeBuilder: (isliked) {
                                  return Icon(
                                    Icons.star,
                                    color: isliked
                                        ? Theme.of(context).iconTheme.color!
                                        : Theme.of(context).canvasColor,
                                  );
                                },
                                onTap: (isLiked) async {
                                  showRatingDialog(
                                      context,
                                      widget.movieModel.id,
                                      widget.movieModel.title!,
                                      widget.movieModel.posterPath!);
                                  return !isLiked;
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    // Align(
                    //   alignment: Alignment.topLeft,
                    //   child: Text(
                    //     "genres",
                    //     style: TextStyle(
                    //       fontSize: 11,
                    //       color: Theme.of(context).textTheme.titleLarge!.color,
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: length,
                            readOnly: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              label: Text(
                                "Duration",
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .color,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              label: Text(
                                "Language",
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .color,
                                ),
                              ),
                            ),
                            controller: language,
                            readOnly: true,
                          ),
                        ),
                        Expanded(
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
                                      .bodyLarge!
                                      .color,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            controller: date,
                            readOnly: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              label: Text(
                                "Release",
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .color,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Synopsis",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.titleLarge!.color,
                        ),
                        textAlign: TextAlign.left,
                      ),
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
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Cast",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).textTheme.titleLarge!.color,
                            ),
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
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Crew",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).textTheme.titleLarge!.color,
                            ),
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
                      height: 10,
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
