class MongoDbModel {
  MongoDbModel({
    this.username,
    this.name,
    required this.email,
    required this.password,
    this.phoneNumber,
    this.gender,
    this.age,
  });

  String? username;
  String? name;
  String email;
  String password;
  int? phoneNumber;
  String? gender;
  int? age;

  factory MongoDbModel.fromJson(Map<String, dynamic> json) => MongoDbModel(
    username: json["username"],
    name: json["name"],
    email: json["email"],
    password: json["password"],
    phoneNumber: json["phone_number"],
    gender: json["gender"],
    age: json["Age"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "name": name,
    "email": email,
    "phone_number": phoneNumber,
    "gender": gender,
    "Age": age,
  };
}
