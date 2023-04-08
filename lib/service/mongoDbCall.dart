import 'dart:developer';
import 'package:mongo_dart/mongo_dart.dart';

const Mongo_URL =
    "mongodb+srv://namanviber:Naman%40123@movigo.xbc31aq.mongodb.net/Movies?retryWrites=true&w=majority";
const Collection_Name = "movieData";

class MongoDatabase {
  static var db, movieCollection;
  static connect() async {
    db = await Db.create(Mongo_URL);
    await db.open();
    inspect(db);
    movieCollection = db.collection(Collection_Name);
  }

  static Future<List<Map<String,dynamic>>> getMovies() async{
    final movieData = await movieCollection.find(where.eq('language', 'en').limit(10)).toList();
    return movieData;
  }

  static Future<List<Map<String,dynamic>>> getPopularMovies() async{
    final movieData = await movieCollection.find(where.eq('language', 'en').limit(10)).toList();
    return movieData;
  }

  // static Future<String> insert(MongoDbModel data) async {
  //   try {
  //     var result = await movieCollection.insertOne(data.toJson());
  //     if (result.isSuccess) {
  //       return "Data Inserted";
  //     } else {
  //       return "Something Went Wrong";
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //     return e.toString();
  //   }
  // }
}
