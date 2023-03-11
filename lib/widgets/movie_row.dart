import 'package:flutter/material.dart';
import 'package:project2/models/movie_model.dart';

class MovieRow extends StatelessWidget {
  MovieRow({required this.model, Key? key}) : super(key: key);
  final MovieModel model;

  @override
  Widget build(BuildContext context) {
    final posterUrl =
        'https://image.tmdb.org/t/p/w600_and_h900_bestv2${model.posterPath}';
    return Column(
      children: [
        Container(
          height: 170,
          width: 125,
          margin: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image:  DecorationImage(
              fit: BoxFit.cover,
              image: posterUrl != ''
                  ? NetworkImage(posterUrl)
                  : AssetImage('assets/images/noimage.png') as ImageProvider,
            ),
          ),
        ),
      ],
    );
  }
}
