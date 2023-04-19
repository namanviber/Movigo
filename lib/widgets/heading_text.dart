import 'package:flutter/material.dart';
import 'item_grid.dart';

class TextHeading extends StatelessWidget {
  TextHeading({required this.heading, required this.movies, Key? key}) : super(key: key);
  String heading;
  var movies;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          heading,
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
            MaterialPageRoute(builder: (context) => ItemGrid(heading: heading, movies: movies,)));
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
