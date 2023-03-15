import 'package:flutter/material.dart';
import 'package:project2/models/movie_model.dart';

class MovieRow extends StatefulWidget {
  MovieRow({required this.model, Key? key}) : super(key: key);
  final MovieModel model;

  @override
  State<MovieRow> createState() => _MovieRowState();
}

class _MovieRowState extends State<MovieRow> {
  @override
  Widget build(BuildContext context) {
    bool state = true;
    final posterUrl =
        'https://image.tmdb.org/t/p/w600_and_h900_bestv2${widget.model.posterPath}';
    return Column(
      children: [
        Container(
          alignment: Alignment.topRight,
          height: 170,
          width: 125,
          margin: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: posterUrl != ''
                  ? NetworkImage(posterUrl)
                  : AssetImage('assets/images/noimage.png') as ImageProvider,
            ),
          ),
          child: IconButton(
            onPressed: (){
              setState(() {
                state = !state;
              });
            },
            color: (state) ? Colors.white: Colors.blue,
            icon: Icon(Icons.check_circle),
          ),
        ),
      ],
    );
  }
}
