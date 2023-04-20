import 'dart:convert';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:bson/src/classes/object_id.dart';


getUserDetails mongoInsertFromJson(String str) => getUserDetails.fromJson(json.decode(str));

String mongoInsertToJson(getUserDetails data) => json.encode(data.toJson());

class getUserDetails {
  getUserDetails({
    required this.uid,
    required this.firebaseId,
    this.name,
    this.age,
    this.gender,
    this.region,
    this.emailId,
    this.phone,
    this.ratings,
    this.watchlist,
    this.watched,
  });

  ObjectId uid;
  String firebaseId;
  String? name;
  int? age;
  String? gender;
  String? region;
  String? emailId;
  int? phone;
  List<Rating>? ratings;
  List<int>? watchlist;
  List<int>? watched;

  factory getUserDetails.fromJson(Map<String, dynamic> json) => getUserDetails(
    firebaseId: json["firebase_id"],
    uid: json['_id'],
    name: json["name"],
    age: json["age"],
    gender: json["gender"],
    region: json["region"],
    emailId: json["email_id"],
    phone: json["phone"],
    ratings: json["ratings"] == null ? [] : List<Rating>.from(json["ratings"]!.map((x) => Rating.fromJson(x))),
    watchlist: json["watchlist"] == null ? [] : List<int>.from(json["watchlist"]!.map((x) => x)),
    watched: json["watched"] == null ? [] : List<int>.from(json["watched"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "firebase_id": firebaseId,
    "name": name,
    "age": age,
    "gender": gender,
    "region": region,
    "email_id": emailId,
    "phone": phone,
    "ratings": ratings == null ? [] : List<dynamic>.from(ratings!.map((x) => x.toJson())),
    "watchlist": watchlist == null ? [] : List<dynamic>.from(watchlist!.map((x) => x)),
    "watched": watched == null ? [] : List<dynamic>.from(watched!.map((x) => x)),
  };
}

class Rating {
  Rating({
    this.tmdbid,
    this.rating,
  });

  int? tmdbid;
  double? rating;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    tmdbid: json["tmdbid"],
    rating: json["rating"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "tmdbid": tmdbid,
    "rating": rating,
  };
}


