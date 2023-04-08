import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project2/models/apiModels/MovieCastDetailsModel.dart';
import 'package:project2/models/apiModels/MovieCrewDetailsModel.dart';
import 'package:project2/models/apiModels/DiscoverMovieModel.dart';
import 'package:project2/service/apiCall.dart';
import 'package:project2/widgets/movie_card.dart';

class ItemGrid extends StatefulWidget {
  String heading;
  // MovieCastDetailsModel? castModel;
  // MovieCrewDetailsModel? crewModel;
  // final DiscoverMovieModel discoverModel;
  ItemGrid({required this.heading, Key? key}) : super(key: key);

  @override
  State<ItemGrid> createState() => _ItemGridState();
}

class _ItemGridState extends State<ItemGrid> {
  List<DiscoverMovieModel> content = [];

  @override
  void initState() {
    super.initState();
    fetchMovies();
  }

  Future<void> fetchMovies() async {
    final response = await discoverMovies();
    setState(() {
      content = response;
    });
  }

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
          child: (state)
              ? SizedBox(
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.all(11),
                      child: GridView.builder(gridDelegate:SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 110,
                        mainAxisExtent: 150,
                        mainAxisSpacing: 11,
                        crossAxisSpacing: 11,
                      ) ,itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage('assets/images/money.jpg'),fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(7),
                          ),
                        );
                      },),
                    ),
                  ),
                )
              : SizedBox(
                  height: 450,
                  width: double.maxFinite,
                  child: ListView.builder(
                    itemCount: content.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, index) {
                      final movie = content[index];
                      return MovieCard(movie: movie);
                    },
                  ),
                ),
        ));
  }
}
