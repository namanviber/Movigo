class getUserDetails {
  getUserDetails({
    required this.firebaseId,
    required this.name,
    required this.age,
    required this.gender,
    required this.region,
    required this.emailId,
    required this.phone,
    required this.ratings,
    required this.watchlist,
    required this.watched,
  });

  String firebaseId;
  String name;
  int age;
  String gender;
  String region;
  String emailId;
  int phone;
  List<Rating> ratings;
  List<int> watchlist;
  List<int> watched;

  factory getUserDetails.fromJson(Map<String, dynamic> json) => getUserDetails(
    firebaseId: json["firebase_id"],
    name: json["name"],
    age: json["age"],
    gender: json["gender"],
    region: json["region"],
    emailId: json["email_id"],
    phone: json["phone"],
    ratings: List<Rating>.from(json["ratings"].map((x) => Rating.fromJson(x))),
    watchlist: List<int>.from(json["watchlist"].map((x) => x)),
    watched: List<int>.from(json["watched"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "firebase_id": firebaseId,
    "name": name,
    "age": age,
    "gender": gender,
    "region": region,
    "email_id": emailId,
    "phone": phone,
    "ratings": List<dynamic>.from(ratings.map((x) => x.toJson())),
    "watchlist": List<dynamic>.from(watchlist.map((x) => x)),
    "watched": List<dynamic>.from(watched.map((x) => x)),
  };
}

class Rating {
  Rating({
    required this.tmdbid,
    required this.rating,
  });

  int tmdbid;
  double rating;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    tmdbid: json["tmdbid"],
    rating: json["rating"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "tmdbid": tmdbid,
    "rating": rating,
  };
}
