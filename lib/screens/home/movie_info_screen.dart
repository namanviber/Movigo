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

    TextEditingController length =
        TextEditingController(text: "${widget.movieModel.runtime} minutes");

    TextEditingController language =
        TextEditingController(text: "${widget.movieModel.originalLanguage}");

    TextEditingController rating =
        TextEditingController(text: "${widget.movieModel.voteAverage}");

    TextEditingController budget =
        TextEditingController(text: "${widget.movieModel.budget}");

    TextEditingController revenue =
        TextEditingController(text: "${widget.movieModel.revenue}");

    TextEditingController release =
        TextEditingController(text: "${widget.movieModel.releaseDate}");

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
              Container(
                foregroundDecoration: BoxDecoration(
                  //3
                  gradient: LinearGradient(
                    //4
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF09090F).withOpacity(0.3),
                      Theme.of(context).primaryColor,
                    ],
                  ),
                ),
                child: Image(
                  image: backdropposterUrl != ''
                      ? NetworkImage(
                          backdropposterUrl,
                        )
                      : const AssetImage('assets/images/noimage.png')
                          as ImageProvider,
                  height: 400,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        originalTitle,
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
                        "genres",
                        style: GoogleFonts.montserrat(fontSize: 11),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 100,
                          child: TextField(
                            controller: length,
                            readOnly: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              label: Text("Length"),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 100,
                          child: TextField(
                            controller: language,
                            readOnly: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              label: Text("Language"),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 50,
                          child: TextField(
                            controller: rating,
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
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                              child: Text(
                            "Already Watched",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: FaIcon(
                            FontAwesomeIcons.bookmark,
                          ),
                          selectedIcon: FaIcon(
                            FontAwesomeIcons.solidBookmark,
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: FaIcon(FontAwesomeIcons.star)),
                        IconButton(
                            onPressed: () {},
                            icon: FaIcon(FontAwesomeIcons.share)),
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
                    // SizedBox(
                    //   height: 215,
                    //   width: double.maxFinite,
                    //   child: ListView.separated(
                    //     itemCount: _movieVideos.length,
                    //     scrollDirection: Axis.horizontal,
                    //     itemBuilder: (BuildContext context, index) {
                    //       final video = _movieVideos[index];
                    //       return MovieVideoRow(model: video);
                    //     },
                    //     separatorBuilder: (BuildContext context, int index) {
                    //       return const SizedBox(
                    //         width: 20,
                    //       );
                    //     },
                    //   ),
                    // ),
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
                    FutureBuilder(
                      future: fetchCreditDetails(widget.movieModel.id),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return SizedBox(
                            height: 190,
                            width: 125,
                            child: const Center(
                                child: CircularProgressIndicator()),
                          );
                        } else {
                          if (snapshot.hasData) {
                            return Column(
                              children: [
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
                                    separatorBuilder:
                                        (BuildContext context, int index) {
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
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return const SizedBox(
                                        width: 20,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return SizedBox(
                              height: 190,
                              width: 125,
                              child: const Center(
                                  child: Text("Some Error Occured")),
                            );
                          }
                        }
                      },
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
                          controller: budget,
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
                          controller: revenue,
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
                          controller: release,
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
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 8),
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
