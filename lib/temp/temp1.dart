import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project2/widgets/movie_card.dart';
import 'package:project2/models/mongoDbModels/getMoviesModel.dart';

class ItemGrid extends StatefulWidget {
  String heading;
  List<dynamic> moviesModel;
  ItemGrid({required this.heading, required this.moviesModel, Key? key})
      : super(key: key);

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
        body: SingleChildScrollView(
          child: SizedBox(
            height: 500,
            width: double.maxFinite,
            child: ListView.builder(
              itemCount: widget.moviesModel.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, index) {
                final movie =
                    getMoviesModel.fromJson(widget.moviesModel[index]);
                return MovieCard(movie: movie);
              },
            ),
          ),
        ));
  }
}
