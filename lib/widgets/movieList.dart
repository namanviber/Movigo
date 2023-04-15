import 'package:flutter/material.dart';
import 'package:project2/models/apiModels/MovieDetailModel.dart';
import 'package:project2/service/apiCall.dart';
import 'package:project2/models/mongoDbModels/getMoviesModel.dart';
import 'package:project2/screens/home/movie_info_screen.dart';

class MovieList extends StatefulWidget {
  final getMoviesModel moviesModel;
  MovieList({required this.moviesModel, Key? key}) : super(key: key);

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  late MovieDetailModel movieDetail;

  Future<void> fetchMovieDetails(int movieid) async {
    final response3 = await movieDetails(movieid);
    setState(() {
      movieDetail = response3;
      print(movieDetail);
    });
  }

  String posterUrl = "";

  @override
  Widget build(BuildContext context) {
    if (widget.moviesModel.posterPath != Null) {
      posterUrl =
          'https://image.tmdb.org/t/p/w600_and_h900_bestv2${widget.moviesModel.posterPath}';
    } else {
      posterUrl = "";
    }
    return InkWell(
      onTap: () {
        fetchMovieDetails(widget.moviesModel.tmdbId);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieInfo(
                      movieModel: movieDetail,
                    )));
      },
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.network(
            posterUrl,
            fit: BoxFit.cover,
            height: 190,
            width: 145,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(
                "assets/images/noimage.png",
                fit: BoxFit.cover,
              );
            },
          )),
    );
  }
}
