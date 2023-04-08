import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

getMoviesModel mongoDbModelFromJson(String str) => getMoviesModel.fromJson(json.decode(str));

String mongoDbModelToJson(getMoviesModel data) => json.encode(data.toJson());

class getMoviesModel {
  getMoviesModel({
    required this.id,
    required this.title,
    required this.genres,
    required this.tmdbId,
    required this.language,
    required this.popularity,
    required this.voteAverage,
    required this.voteCount,
    required this.posterPath,
  });

  ObjectId id;
  String title;
  List<String> genres;
  int tmdbId;
  String language;
  double popularity;
  double voteAverage;
  int voteCount;
  String posterPath;

  factory getMoviesModel.fromJson(Map<String, dynamic> json) => getMoviesModel(
    id: json["_id"],
    title: json["title"],
    genres: List<String>.from(json["genres"].map((x) => x)),
    tmdbId: json["tmdbId"],
    language: json["language"],
    popularity: json["popularity"]?.toDouble(),
    voteAverage: json["vote_average"]?.toDouble(),
    voteCount: json["vote_count"],
    posterPath: json["poster_path"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "genres": List<dynamic>.from(genres.map((x) => x)),
    "tmdbId": tmdbId,
    "language": language,
    "popularity": popularity,
    "vote_average": voteAverage,
    "vote_count": voteCount,
    "poster_path": posterPath,
  };
}
