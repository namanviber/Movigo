import 'dart:developer';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:project2/models/getUserDetails.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'apiCall.dart';

const Mongo_URL =
    "mongodb+srv://namanviber:Naman%40123@movigo.xbc31aq.mongodb.net/Movies?retryWrites=true&w=majority";
const movieDatabase = "movieData";
const userDatabase = "userData";
final userInfo = FirebaseAuth.instance.currentUser!;

class MongoDatabase {
  static var db, movieCollection, userCollection, preferredCollection;

  static connect() async {
    db = await Db.create(Mongo_URL);
    await db.open();
    inspect(db);
    movieCollection = db.collection(movieDatabase);
    preferredCollection = db.collection(movieDatabase);
    userCollection = db.collection(userDatabase);
  }

  // User Specific Functions
  static Future getUserData() async {
    final response =
        await userCollection.findOne(where.eq("firebase_id", userInfo.uid));
    return response;
  }

  static Future<List<dynamic>> userRecommendations() async {
    final response = await userCollection.findOne(
      where.eq("firebase_id", userInfo.uid).excludeFields([
        "_id",
        "firebase_id",
        "name",
        "age",
        "gender",
        "region",
        "email_id",
        "watchlist",
        "watched"
      ]),
    );
    final result = await recommendMovies(response);
    final movie = result["userbased"];
    return movie;
  }

  static Future<List<dynamic>> itemRecommendations() async {
    final response = await userCollection.findOne(
      where.eq("firebase_id", userInfo.uid).excludeFields([
        "_id",
        "firebase_id",
        "name",
        "age",
        "gender",
        "region",
        "email_id",
        "watchlist",
        "watched"
      ]),
    );
    final result = await recommendMovies(response);
    final movie = result["itembased"];
    return movie;
  }

  static Future updateUserData(
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

  static Future<List<Map<String, dynamic>>> preferredMovies(
      List<dynamic> query) async {
    List<Map<String, dynamic>> movieDataList = [];
    for (int i = 0; i < query.length; i++) {
      final movieData =
          await preferredCollection.find(where.eq('tmdbId', query[i])).toList();
      movieDataList.addAll(movieData);
    }
    return movieDataList;
  }

  static Future addWatchlist(int movieid) async {
    var response = await userCollection.updateOne(
        where.eq('firebase_id', userInfo.uid),
        modify.push("watchlist", movieid));
    return response;
  }

  static Future removeWatchlist(int movieid) async {
    var response = await userCollection.updateOne(
        where.eq('firebase_id', userInfo.uid),
        modify.pull("watchlist", movieid));
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

  static Future addWatched(int movieid) async {
    var response = await userCollection.updateOne(
        where.eq('firebase_id', userInfo.uid), modify.push("watched", movieid));
    return response;
  }

  static Future removeWatched(int movieid) async {
    var response = await userCollection.updateOne(
        where.eq('firebase_id', userInfo.uid), modify.pull("watched", movieid));
    return response;
  }

  static Future addRating(int movieid, double rating) async {
    var data = {"tmdbId": movieid, "rating": rating};
    var response = await userCollection.updateOne(
        where.eq('firebase_id', userInfo.uid),
        modify.addToSet("ratings", data));
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

  static Future<List<Map<String, dynamic>>> getTrendingMovies() async {
    final movieData = await movieCollection
        .find(where.eq("genres", "Children").gt('vote_average', 6).limit(30))
        .toList();
    return movieData;
  }

  static Future<List<Map<String, dynamic>>> getComedyMovies() async {
    final movieData = await movieCollection
        .find(where.eq("genres", "Comedy").gt('vote_average', 6).limit(30))
        .toList();
    return movieData;
  }

  static Future<List<Map<String, dynamic>>> getHorrorMovies() async {
    final movieData = await movieCollection
        .find(where.eq("genres", "Horror").gt('vote_average', 6).limit(30))
        .toList();
    return movieData;
  }

  static Future<List<Map<String, dynamic>>> getActionMovies() async {
    final movieData = await movieCollection
        .find(where.eq("genres", "Action").gt('vote_average', 6).limit(30))
        .toList();
    return movieData;
  }

  static Future<List<Map<String, dynamic>>> getFantasyMovies() async {
    final movieData = await movieCollection
        .find(where.eq("genres", "Fantasy").gt('vote_average', 6).limit(30))
        .toList();
    return movieData;
  }

  static Future<List<Map<String, dynamic>>> getRomanceMovies() async {
    final movieData = await movieCollection
        .find(where.eq("genres", "Romance").gt('vote_average', 6).limit(30))
        .toList();
    return movieData;
  }

  static Future<List<Map<String, dynamic>>> getAnimationMovies() async {
    final movieData = await movieCollection
        .find(where.eq("genres", "Animation").gt('vote_average', 6).limit(30))
        .toList();
    return movieData;
  }

  static Future<List<Map<String, dynamic>>> getCrimeMovies() async {
    final movieData = await movieCollection
        .find(where.eq("genres", "Crime").gt('vote_average', 6).limit(30))
        .toList();
    return movieData;
  }

  static Future<List<Map<String, dynamic>>> getDramaMovies() async {
    final movieData = await movieCollection
        .find(where.eq("genres", "Drama").gt('vote_average', 6).limit(30))
        .toList();
    return movieData;
  }

  static Future<List<Map<String, dynamic>>> getMusicalMovies() async {
    final movieData = await movieCollection
        .find(where.eq("genres", "Musical").gt('vote_average', 6).limit(30))
        .toList();
    return movieData;
  }

  static Future<List<Map<String, dynamic>>> getThrillerMovies() async {
    final movieData = await movieCollection
        .find(where.eq("genres", "Thriller").gt('vote_average', 6).limit(30))
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