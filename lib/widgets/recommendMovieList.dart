import 'package:flutter/material.dart';
import 'package:project2/widgets/heading_text.dart';
import 'package:project2/widgets/movieList.dart';
import 'package:project2/models/getMoviesModel.dart';

class recommendMovieList extends StatelessWidget {
  String heading;
  var movies;
  recommendMovieList({required this.heading, required this.movies,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        TextHeading(heading: heading, movies: movies,),
        const SizedBox(
          height: 20,
        ),
        FutureBuilder(
          future: movies,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Loading your recommendations ", style: TextStyle(color: Theme.of(context).textTheme.titleSmall!.color),),
                  CircularProgressIndicator(),
                ],
              ));
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
                return const Center(child: Text("ML API Not Running \n"
                    "Please Wait"));
              }
            }
          },
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
