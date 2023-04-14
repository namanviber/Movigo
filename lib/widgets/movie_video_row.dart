import 'package:flutter/material.dart';
import 'package:project2/models/apiModels/GetMovieVideos.dart';
import 'package:project2/screens/home/movie_info_screen.dart';

class MovieVideoRow extends StatefulWidget {
  MovieVideoRow({required this.model,Key? key})
      : super(key: key);
  final MovieVideos model;

  @override
  State<MovieVideoRow> createState() => _MovieVideoRowState();
}

class _MovieVideoRowState extends State<MovieVideoRow> {
  bool statecolor = true;
  @override
  Widget build(BuildContext context) {
    final posterUrl =
        'https://www.youtube.com/watch?v=${widget.model.key}';

    return InkWell(
      onTap: () {
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
