import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project2/models/DiscoverMovieModel.dart';
import 'package:project2/models/MovieDetailModel.dart';
import 'package:project2/models/MovieCastDetailsModel.dart';
import 'package:project2/models/MovieCrewDetailsModel.dart';

class ApiConfig {
  static const _baseUrl = 'https://api.themoviedb.org/3/';
  static const _apiKey = '60b574988af5f6b7e4f9fd74504d7bbe';

  static Uri generateUrl(String path) {
    final url = '$_baseUrl$path?api_key=$_apiKey';
    final uri = Uri.parse(url);
    return uri;
  }
}

class ApiCall extends StatefulWidget {
  const ApiCall({Key? key}) : super(key: key);

  @override
  State<ApiCall> createState() => _ApiCallState();
}

Future<List<DiscoverMovieModel>> discoverMovies() async {
  const path = 'discover/movie';
  final uri = ApiConfig.generateUrl(path);
  final response = await http.get(uri);
  final json = jsonDecode(response.body);
  final results = json['results'] as List<dynamic>;
  return results.map((e) => DiscoverMovieModel.fromJson(e)).toList();
}

Future<MovieDetailModel> movieDetails(int id) async {
  final path = 'movie/$id';
  final uri = ApiConfig.generateUrl(path);
  final response = await http.get(uri);
  final json = jsonDecode(response.body) as Map<String, dynamic>;
  return MovieDetailModel.fromJson(json);
}

Future<List<MovieCastDetailsModel>> movieCastDetails(int id) async {
  final path = 'movie/$id/credits';
  final uri = ApiConfig.generateUrl(path);
  final response = await http.get(uri);
  final json = jsonDecode(response.body);
  final results = json['cast'] as List<dynamic>;
  return results.map((e) => MovieCastDetailsModel.fromJson(e)).toList();
}

Future<List<MovieCrewDetailsModel>> movieCrewDetails(int id) async {
  final path = 'movie/$id/credits';
  final uri = ApiConfig.generateUrl(path);
  final response = await http.get(uri);
  final json = jsonDecode(response.body);
  final results = json['crew'] as List<dynamic>;
  return results.map((e) => MovieCrewDetailsModel.fromJson(e)).toList();
}

//Recommendations

// Future recommendMovies(var data) async {
//
//   var client = http.Client();
//   var uri = Uri.parse("http://10.7.4.226:5000/predict");
//   Map<String, String> headers = {"Content-type": "application/json"};
//   var post = await client.post(uri,headers: headers, body: jsonEncode(data["ratings"])).then((value){
//     var get = json.decode(value.body);
//     print(get);
//     return get;
//   });
//
// }
// return _netUtil.post(LOGIN_URL, body: {
//   "username": username,
//   "password": password
// }).then((response) {
//   //check response status, if response status OK
//   print("Response Status : $res");
//   if(response.statusCode == 200){
//     var data = json.decode(response.body);
//
//     if(data.length>0){
//       //Convert your JSON to Model here
//     }
//     else{
//       //Get Your ERROR message's here
//       var errorMessage = data["error_msg"];
//     }
//   }
// });

Future recommendMovies(var data) async {
  var client = http.Client();
  var uri = Uri.parse("http://10.7.4.226:5000/predict");
  Map<String, String> headers = {"Content-type": "application/json"};
  String jsonString = json.encode(data["ratings"]);

  try {
    var resp = await client.post(uri, headers: headers, body: jsonString);
    if (resp.statusCode == 200) {
      print("DATA FETCHED SUCCESSFULLY");
      var result = json.decode(resp.body);
      return result;
    }
  } catch (e) {
    throw e;
  }
}

// Future recommendedMovies(var a) async {
//   var client = http.Client();
//   var uri = Uri.parse("http://10.7.4.226:5000/predict");
//   Map<String, String> headers = {"Content-type": "application/json"};
//   String jsonString = json.encode(a);
//   try {
//     var resp = await client.post(uri, headers: headers, body: jsonString);
//     //var resp=await http.get(Uri.parse("http://192.168.1.101:5000"));
//     if (resp.statusCode == 200) {
//       print("DATA FETCHED SUCCESSFULLY");
//       var result = json.decode(resp.body);
//       print(result);
//       return result;
//     }
//   } catch (e) {
//     throw e;
//   }
// }
//
// // Future recommendedMovies(var data) async {
// //   var client = http.Client();
// //   var uri = Uri.parse("http://10.7.4.226:5000/predict");
// //   Map<String, String> headers = {"Content-type": "application/json"};
// //   var post = await client.post(uri,
// //       headers: headers, body: jsonEncode(data["ratings"]));
// //   var get = await http.get(Uri.parse("http://10.7.4.226:5000/predict"));
// //   print(get.body);
// //   return get;
// // }

// Future recommendMovie(var data) async {
//   await http.post(
//     Uri.parse("http://10.7.4.226:5000/predict"),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(data["ratings"]),
//   );
//
//   final response = await http.get(Uri.parse("http://10.7.4.226:5000/predict"));
//   print(response.body);
//   // final results = jsonDecode(response.body);
//   // print(results);
//   return response;
// }

class _ApiCallState extends State<ApiCall> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
