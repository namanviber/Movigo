import 'package:flutter/material.dart';
import 'package:project2/models/DiscoverMovieModel.dart';
import 'package:project2/screens/movie_info_screen.dart';

class MovieRow extends StatefulWidget {
  MovieRow({required this.model,Key? key})
      : super(key: key);
  final DiscoverMovieModel model;

  @override
  State<MovieRow> createState() => _MovieRowState();
}

class _MovieRowState extends State<MovieRow> {
  bool statecolor = true;
  @override
  Widget build(BuildContext context) {
    final posterUrl =
        'https://image.tmdb.org/t/p/w600_and_h900_bestv2${widget.model.posterPath}';

    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieInfo(
                      movieModel: widget.model,
                    )));
      },
      child: Stack(
        children: [
          ClipRRect(
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
          IconButton(
            onPressed: () {
              setState(() {
                statecolor = !statecolor;
              });
            },
            color: (statecolor) ? Colors.white : Colors.blue,
            icon: Icon(Icons.check_circle),
          ),
        ],
      ),
    );
  }
}

// Align(
// alignment: Alignment.topRight,
// child: IconButton(
// onPressed: () {
// setState(() {
// statecolor = !statecolor;
// });
// },
// color: (statecolor) ? Colors.white : Colors.blue,
// icon: Icon(Icons.check_circle),
// ),
// ),
