import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project2/models/cast.dart';
import 'package:project2/models/movie.dart';
import 'package:project2/models/movie_details.dart';
import 'package:project2/service/api_config.dart';

class MovieApi {
  static Future<List<Movie>> discover() async {
    const path = 'discover/movie';
    final uri = ApiConfing.gerateUrl(path);
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    final results = json['results'] as List<dynamic>;
    return results.map((e) => Movie.fromJson(e)).toList();
  }

  static Future<MovieDetails> fetchMovie(int id) async {
    final path = 'movie/$id';
    final uri = ApiConfing.gerateUrl(path);
    final response = await http.get(uri);
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return MovieDetails.fromJson(json);
  }

  static Future<List<Cast>> fetchCast(int id) async {
    final path = 'movie/$id/credits';
    final uri = ApiConfing.gerateUrl(path);
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    final results = json['cast'] as List<dynamic>;
    return results.map((e) => Cast.fromJson(e)).toList();
  }

  static Future<List<Movie>> recommendations(int id) async {
    final path = '/movie/$id/recommendations';
    final uri = ApiConfing.gerateUrl(path);
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    final results = json['results'] as List<dynamic>;
    return results.map((e) => Movie.fromJson(e)).toList();
  }
}
