import "package:flutter/material.dart";
import 'package:project2/widgets/bottom_bar.dart';
import '../widgets/movie_card.dart';
import 'package:project2/models/apiModels/DiscoverMovieModel.dart';
import 'package:project2/service/apiCall.dart';
import 'package:project2/service/mongoDbCall.dart';
import 'package:project2/widgets/movieList.dart';
import 'package:project2/models/mongoDbModels/getMoviesModel.dart';

class WatchlistScreen extends StatefulWidget {
  const WatchlistScreen({Key? key}) : super(key: key);

  @override
  State<WatchlistScreen> createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen> {
  int screen_index = 2;
  int count = 3;

  var fetchmoviedb;

  @override
  void initState() {
    fetchmoviedb = MongoDatabase.getMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        backgroundColor: const Color(0xFF09090F),
        title: TextField(
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
              hintText: "Search",
              filled: true,
              fillColor: const Color(0xFF131313),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide.none),
              prefixIcon: const Icon(Icons.search),
              suffixIcon: const Icon(Icons.history_rounded),
              suffixIconColor: Colors.white,
              prefixIconColor: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      InkWell(
                        child: const Text("Movies",
                            style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                decorationColor: Color(0xFF00B5F3),
                                decorationThickness: 2.0)),
                        onTap: () {},
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        child: const Text(
                          "Shows",
                          style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(Icons.search),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(Icons.filter_list_outlined),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(Icons.grid_view),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      height: 30,
                      width: 150,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: const Color(0xFF00B5F3),
                          borderRadius: BorderRadius.circular(6)),
                      child: const Text(
                        "All Movies",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Inter",
                            fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 30,
                      width: 150,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6)),
                      child: const Text(
                        "Unwatched Movies",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Inter",
                            fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 30,
                      width: 150,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6)),
                      child: const Text(
                        "Watched Movies",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Inter",
                            fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.arrow_upward,
                        color: Color(0xFF00B5F3),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Date Added",
                        style: TextStyle(
                            color: Color(0xFF00B5F3),
                            fontWeight: FontWeight.bold,
                            fontFamily: "Inter",
                            fontSize: 12),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text("content.length.toString()",
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Inter",
                              fontSize: 14)),
                      Text(" items",
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Inter",
                              fontSize: 14)),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              FutureBuilder(
                future: fetchmoviedb,
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                      height: 170,
                      width: 125,
                      child: const Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    if (snapshot.hasData) {
                      return Container(
                        height: 170,
                        width: double.maxFinite,
                        child: ListView.separated(
                          itemCount: 10,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, index) {
                            return MovieList(
                                moviesModel: getMoviesModel
                                    .fromJson(snapshot.data[index]));
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              width: 20,
                            );
                          },
                        ),
                      );
                    } else {
                      return Container(
                        height: 170,
                        width: 125,
                        child: const Center(child: Text("Unavailable Data")),
                      );
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        screen_index: 2,
      ),
    );
  }
}
