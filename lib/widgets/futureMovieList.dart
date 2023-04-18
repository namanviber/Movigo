import 'package:flutter/material.dart';
import 'package:project2/widgets/heading_text.dart';
import 'package:project2/widgets/movieList.dart';
import 'package:project2/models/mongoDbModels/getMoviesModel.dart';

class futureMovieList extends StatelessWidget {
  String heading;
  var movies;
  futureMovieList({required this.heading, required this.movies,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        TextHeading(heading: heading),
        const SizedBox(
          height: 20,
        ),
        FutureBuilder(
          future: movies,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SizedBox(
                height: 190,
                width: 125,
                child:
                const Center(child: CircularProgressIndicator()),
              );
            } else {
              if (snapshot.hasData) {
                return SizedBox(
                  height: 190,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.separated(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, index) {
                      return MovieList(
                          moviesModel: getMoviesModel
                              .fromJson(snapshot.data[index]));
                    },
                    separatorBuilder:
                        (BuildContext context, int index) {
                      return const SizedBox(
                        width: 10,
                      );
                    },
                  ),
                );
              } else {
                return SizedBox(
                  height: 190,
                  width: 125,
                  child:
                  const Center(child: Text("Some Error Occured")),
                );
              }
            }
          },
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
