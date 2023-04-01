import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project2/models/DiscoverMovieModel.dart';
import 'package:project2/models/MovieDetailModel.dart';
import 'package:project2/models/MovieCastDetailsModel.dart';
import 'package:project2/models/MovieCrewDetailsModel.dart';

class ApiConfig {
  static const _baseUrl = 'https://api.themoviedb.org/3/';
  static const _apiKey = '60b574988af5f6b7e4f9fd74504d7bbe';

  static Uri generateUrl(String path) {
    final url = '$_baseUrl$path?api_key=$_apiKey';
    final uri = Uri.parse(url);
    return uri;
  }
}

class ApiCall extends StatefulWidget {
  const ApiCall({Key? key}) : super(key: key);

  @override
  State<ApiCall> createState() => _ApiCallState();
}

Future<List<DiscoverMovieModel>> discoverMovies() async {
  const path = 'discover/movie';
  final uri = ApiConfig.generateUrl(path);
  final response = await http.get(uri);
  final json = jsonDecode(response.body);
  final results = json['results'] as List<dynamic>;
  return results.map((e) => DiscoverMovieModel.fromJson(e)).toList();
}

Future<MovieDetailModel> movieDetails(int id) async {
  final path = 'movie/$id';
  final uri = ApiConfig.generateUrl(path);
  final response = await http.get(uri);
  final json = jsonDecode(response.body) as Map<String, dynamic>;
  return MovieDetailModel.fromJson(json);
}

Future<List<MovieCastDetailsModel>> movieCastDetails(int id) async {
  final path = 'movie/$id/credits';
  final uri = ApiConfig.generateUrl(path);
  final response = await http.get(uri);
  final json = jsonDecode(response.body);
  final results = json['cast'] as List<dynamic>;
  return results.map((e) => MovieCastDetailsModel.fromJson(e)).toList();
}

Future<List<MovieCrewDetailsModel>> movieCrewDetails(int id) async {
  final path = 'movie/$id/credits';
  final uri = ApiConfig.generateUrl(path);
  final response = await http.get(uri);
  final json = jsonDecode(response.body);
  final results = json['crew'] as List<dynamic>;
  return results.map((e) => MovieCrewDetailsModel.fromJson(e)).toList();
}

class _ApiCallState extends State<ApiCall> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
