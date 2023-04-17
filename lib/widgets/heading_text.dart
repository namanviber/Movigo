import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'item_grid.dart';

class TextHeading extends StatelessWidget {
  TextHeading({required this.heading, Key? key})
      : super(key: key);
  String heading;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$heading",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.titleLarge!.color,
          ),
        ),
        Spacer(),
        IconButton(
          onPressed: () {
            // Navigator.push(context,
                // MaterialPageRoute(builder: (context) => ItemGrid(heading: heading,)));
          },
          icon: Icon(Icons.arrow_forward_ios, color: Theme.of(context).textTheme.titleLarge!.color,),
        )
      ],
    );
  }
}
