import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project2/models/movie_model.dart';

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

Future<List<MovieModel>> discoverMovies() async {
  const path = 'discover/movie';
  final uri = ApiConfig.generateUrl(path);
  final response = await http.get(uri);
  final json = jsonDecode(response.body);
  final results = json['results'] as List<dynamic>;
  return results.map((e) => MovieModel.fromJson(e)).toList();
}

class _ApiCallState extends State<ApiCall> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
