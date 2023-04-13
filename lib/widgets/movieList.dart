import 'package:flutter/material.dart';
import 'package:project2/models/apiModels/MovieDetailModel.dart';
import 'package:project2/service/apiCall.dart';
import 'package:project2/models/mongoDbModels/getMoviesModel.dart';

class MovieList extends StatefulWidget {
  final getMoviesModel moviesModel;
  MovieList({required this.moviesModel, Key? key}) : super(key: key);

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  MovieDetailModel? movieDetail;

  var fetchdetails;
  // int? movieiD;
  @override
  void initState() {
    // fetchdetails = fetchMovieDetails(movieiD!);
    super.initState();
  }

  Future<void> fetchMovieDetails(int movieid) async {
    final response3 = await movieDetails(movieid);
    setState(() {
      movieDetail = response3;
    });
  }
  String posterUrl ="";

  @override
  Widget build(BuildContext context) {
    if (widget.moviesModel.posterPath != Null){
      posterUrl =
          'https://image.tmdb.org/t/p/w600_and_h900_bestv2${widget.moviesModel.posterPath}';
    } else {
      posterUrl  = "";
    }
    return FutureBuilder(
      future: fetchdetails,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            height: 170,
            width: 125,
            child: Center(child: CircularProgressIndicator()),
          );
        } else {
          return InkWell(
            onTap: () {
              print("===========================================");
              print(movieDetail);
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => MovieInfo(
              //               movieModel: movieDetail!,
              //             )));
            },
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  posterUrl,
                  fit: BoxFit.cover,
                  height: 170,
                  width: 125,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      "assets/images/noimage.png",
                      fit: BoxFit.cover,
                    );
                  },
                )),
          );
        }
      },
    );
  }
}
