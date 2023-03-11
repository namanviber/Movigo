import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project2/models/movie_model.dart';
import 'package:project2/service/api_config.dart';

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
