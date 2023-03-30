import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project2/models/MovieDetailModel.dart';
import 'package:project2/service/api_call.dart';

class MovieInfo extends StatefulWidget {
  String movieid;
  MovieInfo({required this.movieid, Key? key}) : super(key: key);

  @override
  State<MovieInfo> createState() => _MovieInfoState();
}

class _MovieInfoState extends State<MovieInfo> {

  final backdropposterUrl =
      'https://image.tmdb.org/t/p/original/fSwYa5q2xRkBoOOjueLpkLf3N1m.jpg';
  final posterUrl =
      'https://image.tmdb.org/t/p/original/fSwYa5q2xRkBoOOjueLpkLf3N1m.jpg';
  final genres = "Action, Thriller, Crime";
  final original_title = "John Wick 4";
  TextEditingController length = TextEditingController(text: "2 hr 20 min");
  TextEditingController language = TextEditingController(text: "English");
  TextEditingController rating = TextEditingController(text: "7.3");
  final List<String> imgLists = [
    'assets/images/testimg1.png',
    'assets/images/testimg3.png',
    'assets/images/testimg4.png',
    'assets/images/testimg5.png',
    'assets/images/testimg6.png',
    'assets/images/testimg7.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent,),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(
                image: backdropposterUrl != ''
                    ? NetworkImage(
                        backdropposterUrl,
                      )
                    : AssetImage('assets/images/noimage.png') as ImageProvider,
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
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        genres.toString(),
                        style: GoogleFonts.montserrat(fontSize: 11),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
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
                        Container(
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
                        Container(
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
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                        onTap: () {},
                        child: Container(
                          height: 45,
                          width: double.maxFinite,
                          child: Center(
                              child: Text(
                            "Already Watched",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10)),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.bookmark,
                          semanticLabel: "Save",
                          size: 35,
                        ),
                        Icon(
                          Icons.star,
                          semanticLabel: "Rate this Movie",
                          size: 35,
                        ),
                        Icon(
                          Icons.ios_share_outlined,
                          semanticLabel: "Share",
                          size: 35,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "With the price on his head ever increasing, John Wick uncovers a path to defeating The High Table. But before he can earn his freedom, Wick must face off against a new enemy with powerful alliances across the globe and forces that turn old friends into foes.",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(""),
                    SizedBox(
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
                    Container(
                      height: 170,
                      width: double.maxFinite,
                      child: ListView.builder(
                        itemCount: imgLists.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, index) {
                          return Column(
                            children: [
                              Container(
                                alignment: Alignment.topRight,
                                height: 170,
                                width: 125,
                                margin: EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: posterUrl != ''
                                        ? NetworkImage(posterUrl)
                                        : AssetImage(
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
                    SizedBox(
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
                      height: 170,
                      width: double.maxFinite,
                      child: ListView.builder(
                        itemCount: imgLists.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, index) {
                          return Column(
                            children: [
                              Container(
                                alignment: Alignment.topRight,
                                height: 170,
                                width: 125,
                                margin: EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: posterUrl != ''
                                        ? NetworkImage(posterUrl)
                                        : AssetImage(
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
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Cast",
                        style: GoogleFonts.montserrat(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 170,
                      width: double.maxFinite,
                      child: ListView.builder(
                        itemCount: imgLists.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, index) {
                          return Column(
                            children: [
                              Container(
                                alignment: Alignment.topRight,
                                height: 170,
                                width: 125,
                                margin: EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: posterUrl != ''
                                        ? NetworkImage(posterUrl)
                                        : AssetImage(
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
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Crew",
                        style: GoogleFonts.montserrat(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 170,
                      width: double.maxFinite,
                      child: ListView.builder(
                        itemCount: imgLists.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, index) {
                          return Column(
                            children: [
                              Container(
                                alignment: Alignment.topRight,
                                height: 170,
                                width: 125,
                                margin: EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: posterUrl != ''
                                        ? NetworkImage(posterUrl)
                                        : AssetImage(
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
                    SizedBox(
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
                    SizedBox(
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
                    Container(
                      height: 170,
                      width: double.maxFinite,
                      child: ListView.builder(
                        itemCount: imgLists.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, index) {
                          return Column(
                            children: [
                              Container(
                                alignment: Alignment.topRight,
                                height: 170,
                                width: 125,
                                margin: EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: posterUrl != ''
                                        ? NetworkImage(posterUrl)
                                        : AssetImage(
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
