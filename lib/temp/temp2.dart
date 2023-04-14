import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project2/models/mongoDbModels/getMoviesModel.dart';
import 'temp1.dart';

class Heading extends StatelessWidget {
  Heading({required this.heading, required this.moviesModel, Key? key})
      : super(key: key);
  String heading;
  List<dynamic> moviesModel;

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
                MaterialPageRoute(builder: (context) => ItemGrid(heading: heading, moviesModel: moviesModel,)));
          },
          child: Icon(Icons.arrow_forward_ios),
        )
      ],
    );
  }
}
