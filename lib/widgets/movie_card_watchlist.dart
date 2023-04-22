import 'package:flutter/material.dart';
import 'package:project2/models/MovieDetailModel.dart';
import 'package:project2/models/getWatchlistModel.dart';
import 'package:project2/screens/home/movieDetail.dart';
import 'package:project2/service/apiCall.dart';


class MovieCardWatch extends StatefulWidget {
  final getWatchlistModel movie;
  const MovieCardWatch({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  State<MovieCardWatch> createState() => _MovieCardWatchState();
}

class _MovieCardWatchState extends State<MovieCardWatch> {
  @override
  Widget build(BuildContext context) {
    final posterUrl =
        'https://image.tmdb.org/t/p/w600_and_h900_bestv2${widget.movie.result.first.posterPath}';

    Future<void> fetchMovieDetails(int movieid) async {
      print(movieid);
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

    return InkWell(
      onTap: (){
        setState(() {
          fetchMovieDetails(widget.movie.result.first.tmdbId);
        });
      },
      child: Card(
        elevation: 3.0,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                posterUrl,
                fit: BoxFit.cover,
                height: double.infinity,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                icon: Icon(
                  Icons.bookmark,
                  size: 28,
                  color: Color(0xFF6280CC),
                ),
                onPressed: () {},
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.7),
                    ],
                  ),
                ),
                padding: EdgeInsets.all(10.0),
                child: Text(
                  widget.movie.result.first.title,
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}
