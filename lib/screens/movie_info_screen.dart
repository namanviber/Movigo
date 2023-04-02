import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project2/models/DiscoverMovieModel.dart';
import 'package:project2/models/MovieDetailModel.dart';
import 'package:project2/models/MovieCastDetailsModel.dart';
import 'package:project2/models/MovieCrewDetailsModel.dart';
import 'package:project2/service/api_call.dart';
import 'package:project2/widgets/heading_text.dart';
import 'package:project2/widgets/item_grid.dart';
import 'package:project2/widgets/movie_cast_row.dart';
import 'package:project2/widgets/movie_crew_row.dart';

class MovieInfo extends StatefulWidget {
  final DiscoverMovieModel movieModel;
  MovieInfo({required this.movieModel, Key? key}) : super(key: key);

  @override
  State<MovieInfo> createState() => _MovieInfoState();
}

class _MovieInfoState extends State<MovieInfo> {
  List<MovieCastDetailsModel> _movieCast = [];
  List<MovieCrewDetailsModel> _movieCrew = [];
  late MovieDetailModel movieDetail;
  int moviecode = 76600;

  @override
  void initState() {
    super.initState();
    fetchMovieDetails(moviecode);
    fetchCreditDetails(moviecode);
  }

  Future<void> fetchMovieDetails(int movieid) async {
    final response3 = await movieDetails(movieid);
    setState(() {
      movieDetail = response3;
    });
  }

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
    //     'https://image.tmdb.org/t/p/original/${movieDetail.belongsToCollection.posterPath}';

    final posterUrlbelongs =
        'https://image.tmdb.org/t/p/original/${widget.movieModel.posterPath}';

    // final genres = "${movieDetail.genres.toString()}";

    final original_title = "${widget.movieModel.originalTitle}";

    // TextEditingController length =
    //     TextEditingController(text: "${movieDetail.runtime} minutes");

    // TextEditingController language =
    //     TextEditingController(text: "${movieDetail.originalLanguage}");

    // TextEditingController rating =
    //     TextEditingController(text: "${movieDetail.voteAverage}");

    // TextEditingController budget =
    //     TextEditingController(text: "${movieDetail.budget}");
    //
    // TextEditingController revenue =
    //     TextEditingController(text: "${movieDetail.revenue}");

    // TextEditingController release =
    //     TextEditingController(text: "${movieDetail.releaseDate}");

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(
                image: backdropposterUrl != ''
                    ? NetworkImage(
                        backdropposterUrl,
                      )
                    : const AssetImage('assets/images/noimage.png') as ImageProvider,
                height: 400,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        original_title,
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "genres.toString()",
                        style: GoogleFonts.montserrat(fontSize: 11),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 100,
                          child: TextField(
                            // controller: length,
                            readOnly: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              label: Text("Length"),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 100,
                          child: TextField(
                            // controller: language,
                            readOnly: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              label: Text("Language"),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 50,
                          child: TextField(
                            // controller: rating,
                            readOnly: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              label: Text("Rating"),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                        onTap: () {},
                        child: Container(
                          height: 45,
                          width: double.maxFinite,
                          child: const Center(
                              child: Text(
                            "Already Watched",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10)),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.bookmark,
                          semanticLabel: "Save",
                          size: 35,
                        ),
                        const Icon(
                          Icons.star,
                          semanticLabel: "Rate this Movie",
                          size: 35,
                        ),
                        const Icon(
                          Icons.ios_share_outlined,
                          semanticLabel: "Share",
                          size: 35,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "${widget.movieModel.overview}",
                      style: const TextStyle(
                        fontFamily: "Inter",
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(""),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Videos",
                        style: GoogleFonts.montserrat(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 170,
                      width: double.maxFinite,
                      child: ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, index) {
                          return Column(
                            children: [
                              Container(
                                alignment: Alignment.topRight,
                                height: 170,
                                width: 125,
                                margin: const EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: posterUrl != ''
                                        ? NetworkImage(posterUrl)
                                        : const AssetImage(
                                                'assets/images/noimage.png')
                                            as ImageProvider,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Collection",
                        style: GoogleFonts.montserrat(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 400,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: posterUrl != ''
                              ? NetworkImage(posterUrlbelongs)
                              : const AssetImage('assets/images/noimage.png')
                                  as ImageProvider,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextHeading(heading: "Cast"),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 215,
                      width: double.maxFinite,
                      child: ListView.separated(
                        itemCount: _movieCast.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, index) {
                          final cast = _movieCast[index];
                          return MovieCastRow(model: cast);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            width: 20,
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextHeading(heading: "Crew"),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 215,
                      width: double.maxFinite,
                      child: ListView.separated(
                        itemCount: _movieCrew.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, index) {
                          final crew = _movieCrew[index];
                          return MovieCrewRow(model: crew);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            width: 20,
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Information",
                        style: GoogleFonts.montserrat(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        TextField(
                          // controller: budget,
                          readOnly: true,
                          decoration: InputDecoration(
                              label: Text(
                            "Budget",
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                            ),
                          )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          // controller: revenue,
                          readOnly: true,
                          decoration: InputDecoration(
                              label: Text(
                            "Revenue",
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                            ),
                          )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          // controller: release,
                          readOnly: true,
                          decoration: InputDecoration(
                              label: Text(
                            "Release Date",
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                            ),
                          )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Production Companies",
                        style: GoogleFonts.montserrat(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 170,
                      width: double.maxFinite,
                      child: ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, index) {
                          return Column(
                            children: [
                              Container(
                                alignment: Alignment.topRight,
                                height: 170,
                                width: 125,
                                margin: const EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: posterUrl != ''
                                        ? NetworkImage(posterUrl)
                                        : const AssetImage(
                                                'assets/images/noimage.png')
                                            as ImageProvider,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
