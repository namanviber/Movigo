import 'package:mongo_dart/mongo_dart.dart';

class getWatchedModel {
  ObjectId id;
  String firebaseId;
  String name;
  int age;
  String gender;
  String region;
  String emailId;
  List<Rating> ratings;
  List<int> watchlist;
  int watched;
  List<Result> result;

  getWatchedModel({
    required this.id,
    required this.firebaseId,
    required this.name,
    required this.age,
    required this.gender,
    required this.region,
    required this.emailId,
    required this.ratings,
    required this.watchlist,
    required this.watched,
    required this.result,
  });

  factory getWatchedModel.fromJson(Map<String, dynamic> json) => getWatchedModel(
    id: json["_id"],
    firebaseId: json["firebase_id"],
    name: json["name"],
    age: json["age"],
    gender: json["gender"],
    region: json["region"],
    emailId: json["email_id"],
    ratings: List<Rating>.from(json["ratings"].map((x) => Rating.fromJson(x))),
    watchlist: List<int>.from(json["watchlist"].map((x) => x)),
    watched: json["watched"],
    result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "firebase_id": firebaseId,
    "name": name,
    "age": age,
    "gender": gender,
    "region": region,
    "email_id": emailId,
    "ratings": List<dynamic>.from(ratings.map((x) => x.toJson())),
    "watchlist": List<dynamic>.from(watchlist.map((x) => x)),
    "watched": watched,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class Rating {
  double rating;
  int tmdbId;

  Rating({
    required this.rating,
    required this.tmdbId,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    rating: json["rating"]?.toDouble(),
    tmdbId: json["tmdbId"],
  );

  Map<String, dynamic> toJson() => {
    "rating": rating,
    "tmdbId": tmdbId,
  };
}

class Result {
  ObjectId id;
  String title;
  List<String> genres;
  int tmdbId;
  String language;
  double popularity;
  double voteAverage;
  int voteCount;
  String posterPath;
  DateTime releaseDate;
  String verdict;

  Result({
    required this.id,
    required this.title,
    required this.genres,
    required this.tmdbId,
    required this.language,
    required this.popularity,
    required this.voteAverage,
    required this.voteCount,
    required this.posterPath,
    required this.releaseDate,
    required this.verdict,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["_id"],
    title: json["title"],
    genres: List<String>.from(json["genres"].map((x) => x)),
    tmdbId: json["tmdbId"],
    language: json["language"],
    popularity: json["popularity"]?.toDouble(),
    voteAverage: json["vote_average"]?.toDouble(),
    voteCount: json["vote_count"],
    posterPath: json["poster_path"],
    releaseDate: DateTime.parse(json["release_date"]),
    verdict: json["verdict"],
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
    "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
    "verdict": verdict,
  };
}
