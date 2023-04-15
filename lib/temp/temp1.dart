import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project2/widgets/movie_card.dart';
import 'package:project2/models/mongoDbModels/getMoviesModel.dart';

class ItemGrid extends StatefulWidget {
  String heading;
  ItemGrid({required this.heading, Key? key}) : super(key: key);

  @override
  State<ItemGrid> createState() => _ItemGridState();
}

class _ItemGridState extends State<ItemGrid> {
  bool state = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Spacer(),
            Text(
              '${widget.heading}',
              style: GoogleFonts.montserrat(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            InkWell(
              onTap: () {
                setState(() {
                  state = !state;
                });
              },
              child: Container(
                margin: EdgeInsets.only(left: 60),
                child: (state)
                    ? Icon(
                        Icons.table_rows,
                      )
                    : Icon(
                        Icons.grid_view_rounded,
                      ),
              ),
            ),
          ],
        ),
        backgroundColor: Color(0xff00000C),
      ),
      body: (state)
          ? SizedBox(
              height: 500,
              width: double.maxFinite,
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, index) {
                  // final movie =
                  //     getMoviesModel.fromJson([]);
                  // return MovieCard(movie: movie);
                  return Center();
                },
              ),
            )
          : SizedBox(
              height: 500,
              width: double.maxFinite,
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, index) {
                  // final movie =
                  // getMoviesModel.fromJson([]);
                  // return MovieCard(movie: movie);
                  return Center();
                },
              ),
            ),
    );
  }
}
