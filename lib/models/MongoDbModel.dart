class MongoDbModel {
  MongoDbModel({
    required this.userId,
    required this.username,
    this.name,
    required this.email,
    this.phoneNumber,
    this.gender,
    this.age,
  });

  String? userId;
  String? username;
  String? name;
  String? email;
  int? phoneNumber;
  String? gender;
  int? age;

  factory MongoDbModel.fromJson(Map<String, dynamic> json) => MongoDbModel(
    userId: json["user_id"],
    username: json["username"],
    name: json["name"],
    email: json["email"],
    phoneNumber: json["phone_number"],
    gender: json["gender"],
    age: json["Age"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "username": username,
    "name": name,
    "email": email,
    "phone_number": phoneNumber,
    "gender": gender,
    "Age": age,
  };
}
