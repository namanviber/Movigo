import 'package:flutter/material.dart';
import 'package:project2/models/MovieDetailModel.dart';
import 'package:project2/service/apiCall.dart';
import 'package:project2/models/getMoviesModel.dart';
import 'package:project2/screens/home/movieDetail.dart';

class MovieList extends StatefulWidget {
  final getMoviesModel moviesModel;
  const MovieList({required this.moviesModel, Key? key}) : super(key: key);

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {

  //Fetch Movie Details from API
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
        setState(() {
          fetchMovieDetails(widget.moviesModel.tmdbId);
        });
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
