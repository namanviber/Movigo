import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project2/models/apiModels/MovieDetailModel.dart';
import 'package:project2/models/apiModels/MovieCastDetailsModel.dart';
import 'package:project2/models/apiModels/MovieCrewDetailsModel.dart';
import 'package:project2/service/apiCall.dart';
import 'package:project2/widgets/heading_text.dart';
import 'package:project2/widgets/movie_cast_row.dart';
import 'package:project2/widgets/movie_crew_row.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MovieInfo extends StatefulWidget {
  final MovieDetailModel movieModel;
  const MovieInfo({required this.movieModel, Key? key}) : super(key: key);

  @override
  State<MovieInfo> createState() => _MovieInfoState();
}

class _MovieInfoState extends State<MovieInfo> {
  List<MovieCastDetailsModel> _movieCast = [];
  List<MovieCrewDetailsModel> _movieCrew = [];

  Future<void> fetchCreditDetails(int movieid) async {
    final response1 = await movieCastDetails(movieid);
    final response2 = await movieCrewDetails(movieid);
    setState(() {
      _movieCast = response1;
      _movieCrew = response2;
    });
  }

  @override
  Widget build(BuildContext context) {
    final backdropposterUrl =
        'https://image.tmdb.org/t/p/original/${widget.movieModel.backdropPath}';

    final posterUrl =
        'https://image.tmdb.org/t/p/original/${widget.movieModel.posterPath}';

    // final posterUrlbelongs =
    //     'https://image.tmdb.org/t/p/original/${widget.movieModel.belongsToCollection.posterPath}';

    final posterUrlbelongs =
        'https://image.tmdb.org/t/p/original/${widget.movieModel.posterPath}';

    // final b = widget.movieModel.genres.single.name;
    // print(b);

    final originalTitle = "${widget.movieModel.originalTitle}";

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SlidingUpPanel(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50), topRight: Radius.circular(50)),
        minHeight: MediaQuery.of(context).size.height * 0.6,
        maxHeight: MediaQuery.of(context).size.height * 0.85,
        panel: Container(child: Text("This is the sliding Widget")),
        body: Image(
          image: backdropposterUrl != ''
              ? NetworkImage(
                  backdropposterUrl,
                )
              : const AssetImage('assets/images/noimage.png') as ImageProvider,
          height: 400,
          width: double.maxFinite,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
