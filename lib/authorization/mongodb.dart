import 'dart:developer';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:project2/models/MongoDbModel.dart';

const Mongo_URL =
    "mongodb+srv://namanviber:Naman%40123@movigo.xbc31aq.mongodb.net/User_Authorization?retryWrites=true&w=majority";
const Collection_Name = "Users";

class MongoDatabase {
  static var db, userCollection;
  static connect() async {
    db = await Db.create(Mongo_URL);
    await db.open();
    inspect(db);
    userCollection = db.collection(Collection_Name);
  }

  static Future<String> insert(MongoDbModel data) async {
    try {
      var result = await userCollection.insertOne(data.toJson());
      if (result.isSuccess) {
        return "Data Inserted";
      } else {
        return "Something Went Wrong";
      }
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }
}
