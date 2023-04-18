class getMoviesModel {
  getMoviesModel( {
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

  Object id;
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
