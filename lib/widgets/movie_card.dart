import 'package:flutter/material.dart';
import 'package:project2/models/apiModels/DiscoverMovieModel.dart';

class MovieCard extends StatelessWidget {
  final DiscoverMovieModel movie;
  const MovieCard({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final posterUrl =
        'https://image.tmdb.org/t/p/w600_and_h900_bestv2${movie.posterPath}';
    return Container(
      height: 150,
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 130,
            width: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: posterUrl != ''
                    ? NetworkImage(posterUrl)
                    : AssetImage('assets/images/noimage.png') as ImageProvider,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.title != '' ? movie.title : "Untitled",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Inter",
                    fontSize: 11),
                maxLines: 3,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                  movie.genreIds != '' ? movie.genreIds.toString() : "Untitled",
                  style: TextStyle(
                      color: Colors.white, fontFamily: "Inter", fontSize: 8)),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Icon(Icons.calendar_month),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                      movie.releaseDate != ''
                          ? movie.releaseDate.toString()
                          : "Untitled",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Inter",
                          fontSize: 8)),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
