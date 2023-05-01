import 'package:flutter/material.dart';
import 'item_grid.dart';

class TextHeading extends StatefulWidget {
  TextHeading({required this.heading, required this.movies, Key? key}) : super(key: key);
  String heading;
  var movies;

  @override
  State<TextHeading> createState() => _TextHeadingState();
}

class _TextHeadingState extends State<TextHeading> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.heading,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.titleLarge!.color,
          ),
        ),
        Spacer(),
        IconButton(
          onPressed: () {
            Navigator.push(context,
            MaterialPageRoute(builder: (context) => ItemGrid(heading: widget.heading, movies: widget.movies,)));
          },
          icon: Icon(
            Icons.arrow_forward_ios,
            color: Theme.of(context).textTheme.titleLarge!.color,
          ),
        )
      ],
    );
  }
}
