import 'package:flutter/material.dart';
import 'package:project2/models/movie.dart';
import 'package:project2/service/movie_api.dart';
import 'package:project2/widgets/movie_card.dart';

class MovieTab extends StatefulWidget {
  const MovieTab({Key? key}) : super(key: key);

  @override
  State<MovieTab> createState() => _MovieTabState();
}

class _MovieTabState extends State<MovieTab> {
  List<Movie> discoverMovies = [];

  @override
  void initState() {
    super.initState();
    fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: discoverMovies.length,
      itemBuilder: (context, index) {
        final movie = discoverMovies[index];
        return MovieCard(movie: movie);
      },
    );
  }

  Future<void> fetchMovies() async {
    final response = await MovieApi.discover();
    setState(() {
      discoverMovies = response;
    });
  }
}
