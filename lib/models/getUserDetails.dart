class getUserDetails {
  getUserDetails({
    required this.id,
    required this.firebaseId,
    this.name,
    this.age,
    this.gender,
    this.region,
    required this.emailId,
    this.ratings,
    this.watchlist,
    this.watched,
  });

  Object id;
  String firebaseId;
  String? name;
  int? age;
  String? gender;
  String? region;
  String emailId;
  List<Rating>? ratings;
  List<int>? watchlist;
  List<int>? watched;

  factory getUserDetails.fromJson(Map<String, dynamic> json) => getUserDetails(
        id: json["_id"],
        firebaseId: json["firebase_id"],
        name: json["name"],
        age: json["age"],
        gender: json["gender"],
        region: json["region"],
        emailId: json["email_id"],
        ratings: json["ratings"] == null
            ? []
            : List<Rating>.from(
                json["ratings"]!.map((x) => Rating.fromJson(x))),
        watchlist: json["watchlist"] == null
            ? []
            : List<int>.from(json["watchlist"]!.map((x) => x)),
        watched: json["watched"] == null
            ? []
            : List<int>.from(json["watched"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "firebase_id": firebaseId,
        "name": name,
        "age": age,
        "gender": gender,
        "region": region,
        "email_id": emailId,
        "ratings": ratings == null
            ? []
            : List<dynamic>.from(ratings!.map((x) => x.toJson())),
        "watchlist": watchlist == null
            ? []
            : List<dynamic>.from(watchlist!.map((x) => x)),
        "watched":
            watched == null ? [] : List<dynamic>.from(watched!.map((x) => x)),
      };
}

class Rating {
  Rating({
    this.rating,
    this.tmdbId,
  });

  double? rating;
  int? tmdbId;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rating: json["rating"]?.toDouble(),
        tmdbId: json["tmdbId"],
      );

  Map<String, dynamic> toJson() => {
        "rating": rating,
        "tmdbId": tmdbId,
      };
}
