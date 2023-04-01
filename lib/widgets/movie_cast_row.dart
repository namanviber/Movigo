import 'package:flutter/material.dart';
import 'package:project2/models/MovieCastDetailsModel.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieCastRow extends StatefulWidget {
  MovieCastRow({required this.model, Key? key}) : super(key: key);
  final MovieCastDetailsModel model;

  @override
  State<MovieCastRow> createState() => _MovieCastRowState();
}

class _MovieCastRowState extends State<MovieCastRow> {
  @override
  Widget build(BuildContext context) {
    final posterUrl =
        'https://image.tmdb.org/t/p/original${widget.model.profilePath}';
    return SizedBox(
      width: 125,
      child: Column(
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
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              widget.model.name.toString(),
              style: GoogleFonts.montserrat(
                  fontSize: 14, fontWeight: FontWeight.w700),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              widget.model.character.toString(),
              style: GoogleFonts.montserrat(fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }
}
