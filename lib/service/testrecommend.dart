import 'package:flutter/material.dart';
import 'package:project2/models/movie_model.dart';
import 'package:project2/service/api_call.dart';
import 'package:project2/widgets/movie_card.dart';

class MovieTab extends StatefulWidget {
  const MovieTab({Key? key}) : super(key: key);

  @override
  State<MovieTab> createState() => _MovieTabState();
}

class _MovieTabState extends State<MovieTab> {
  List<MovieModel> content = [];

  @override
  void initState() {
    super.initState();
    fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: content.length,
        itemBuilder: (context, index) {
          final movie = content[index];
          return MovieCard(movie: movie);
        },
      ),
    );
  }

  Future<void> fetchMovies() async {
    final response = await discoverMovies();
    setState(() {
      content = response;
    });
  }
}
