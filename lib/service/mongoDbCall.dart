import 'dart:developer';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:project2/models/getUserDetails.dart';
import 'package:firebase_auth/firebase_auth.dart';

const Mongo_URL =
    "mongodb+srv://namanviber:Naman%40123@movigo.xbc31aq.mongodb.net/Movies?retryWrites=true&w=majority";
const movieDatabase = "movieData";
const userDatabase = "userData";
final userInfo = FirebaseAuth.instance.currentUser!;

class MongoDatabase {
  static var db, movieCollection, userCollection;

  static connect() async {
    db = await Db.create(Mongo_URL);
    await db.open();
    inspect(db);
    movieCollection = db.collection(movieDatabase);
    userCollection = db.collection(userDatabase);
  }

  // User Specific Functions
  static Future<getUserDetails> getUserData() async {
    final response =
        await userCollection.findOne(where.eq("firebase_id", userInfo.uid));
    final result = getUserDetails.fromJson(response);
    return result;
  }

  static Future<getUserDetails> updateUserData(
      String name, int age, String gender, String region) async {
    var response = await userCollection.updateOne(
        where.eq('firebase_id', userInfo.uid),
        ModifierBuilder()
            .set('name', name)
            .set('age', age)
            .set('gender', gender)
            .set('region', region));
    return response;
  }

  static Future<getUserDetails> addWatchlist(int movieid) async {
    var response = await userCollection.updateOne(
        where.eq('firebase_id', userInfo.uid),
        modify.push("watchlist", movieid));
    return response;
  }

  static Future<getUserDetails> removeWatchlist(int movieid) async {
    var response = await userCollection.updateOne(
        where.eq('firebase_id', userInfo.uid), modify.popFirst("watchlist"));
    return response;
  }

  static Future<List<Map<String, dynamic>>> showWatchlist() async {
    final pipeline = AggregationPipelineBuilder()
        .addStage(Match({"firebase_id": userInfo.uid}))
        .addStage(Unwind(Field("watchlist")))
        .addStage(Lookup(
            from: "movieData",
            localField: "watchlist",
            foreignField: "tmdbId",
            as: "result"))
        .build();

    final results =
        await DbCollection(db, "userData").aggregateToStream(pipeline).toList();
    return results;
  }

  static Future<List<Map<String, dynamic>>> showWatched() async {
    final pipeline = AggregationPipelineBuilder()
        .addStage(Match({"firebase_id": userInfo.uid}))
        .addStage(Unwind(Field("watched")))
        .addStage(Lookup(
            from: "movieData",
            localField: "watched",
            foreignField: "tmdbId",
            as: "result"))
        .build();

    final results =
        await DbCollection(db, "userData").aggregateToStream(pipeline).toList();
    return results;
  }

  static Future<getUserDetails> addWatched(int movieid) async {
    var response = await userCollection.updateOne(
        where.eq('firebase_id', userInfo.uid), modify.push("watched", movieid));
    return response;
  }

  static Future<getUserDetails> removeWatched(int movieid) async {
    var response = await userCollection.updateOne(
        where.eq('firebase_id', userInfo.uid), modify.popFirst("watched"));
    return response;
  }

  static Future<getUserDetails> addRating(int movieid, double rating) async {
    var data = {"tmdbid": movieid, "rating": rating};
    var response = await userCollection.updateOne(
        where.eq('firebase_id', userInfo.uid),
        modify.addToSet("ratings", data));
    return response;
  }

  static Future<getUserDetails> removeRating(int movieid, double rating) async {
    var response = await userCollection.updateOne(
        where.eq('firebase_id', userInfo.uid), modify.popFirst("rating"));
    return response;
  }

  // Movie Specific Functions
  static Future<List<Map<String, dynamic>>> getMovies() async {
    final movieData = await movieCollection
        .find(where.eq('language', 'en').limit(30))
        .toList();
    return movieData;
  }

  static Future<List<Map<String, dynamic>>> getPopularMovies() async {
    final movieData = await movieCollection
        .find(where.limit(30).sortBy('popularity', descending: true))
        .toList();
    return movieData;
  }

  static Future<List<Map<String, dynamic>>> getScifiMovies() async {
    final movieData = await movieCollection
        .find(where.eq("genres", "Sci-Fi").gt('vote_average', 8).limit(30))
        .toList();
    return movieData;
  }

  static Future<List<Map<String, dynamic>>> getKidsMovies() async {
    final movieData = await movieCollection
        .find(where
            .eq("genres", "Children")
            .sortBy('popularity', descending: true)
            .limit(30))
        .toList();
    return movieData;
  }

  static Future<List<Map<String, dynamic>>> getTopRated() async {
    final movieData = await movieCollection
        .find(where
            .sortBy('vote_average', descending: true)
            .gt('vote_count', 50)
            .limit(30))
        .toList();
    return movieData;
  }

  static Future<List<Map<String, dynamic>>> getHorrorComedy() async {
    final movieData = await movieCollection
        .find(where.eq("genres", "Horror").eq("genres", "Comedy").limit(30))
        .toList();
    return movieData;
  }

  static Future<List<Map<String, dynamic>>> getComedy() async {
    final movieData = await movieCollection
        .find(where.eq("genres", "Comedy").limit(30))
        .toList();
    return movieData;
  }

  static Future<List<Map<String, dynamic>>> getHorror() async {
    final movieData = await movieCollection
        .find(where.eq("genres", "Horror").limit(30))
        .toList();
    return movieData;
  }

  //Searching Movies Function
  static Future<List<Map<String, dynamic>>> searchMovies(String query) async {
    final movieData = await movieCollection
        .find(where.match('title', query, caseInsensitive: true))
        .toList();
    return movieData;
  }

  static Future<List<Map<String, dynamic>>> searchGenre(String query) async {
    final movieData = await movieCollection
        .find(where.match('genres', query, caseInsensitive: true))
        .toList();
    return movieData;
  }

  // Adding Userdata
  static Future<String> addUserData(getUserDetails data) async {
    try {
      var result = await userCollection.insertOne(data.toJson());
      if (result.isSuccess) {
        return "Data Inserted";
      } else {
        return "Something Went Wrong";
      }
    } catch (e) {
      return e.toString();
    }
  }
}
