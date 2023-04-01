import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'item_grid.dart';

class TextHeading extends StatelessWidget {
  TextHeading({required this.heading, Key? key})
      : super(key: key);
  String? heading;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$heading",
          style: GoogleFonts.montserrat(
              fontSize: 17, fontWeight: FontWeight.bold),
        ),
        Spacer(),
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ItemGrid()));
          },
          child: Icon(Icons.arrow_forward_ios),
        )
      ],
    );
  }
}
