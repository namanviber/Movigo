import 'dart:developer';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:project2/models/mongoDbModels/MongoDbModel.dart';
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
  static Future<String> addUserData(MongoDbModel data) async {
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