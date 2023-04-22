import 'package:mongo_dart/mongo_dart.dart' as M;
import 'package:project2/models/getUserDetails.dart';
import 'package:project2/service/mongoDbCall.dart';

Future<void> insertintoDB(String firebaseid, String name , String email, int age, String gender, int phone) async
{
  var _id = M.ObjectId();
  final data = getUserDetails(
    firebaseId: firebaseid,
    id: _id,
    name: name,
    emailId: email,
    age: age,
    gender: gender,
  );
  var results = await MongoDatabase.addUserData(data);
}

