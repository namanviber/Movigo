import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project2/models/getMoviesModel.dart';
import 'package:project2/screens/authorization/sign_up_screen.dart';
import 'package:project2/utilities/authPage.dart';

import '../../service/mongoDbCall.dart';

class PreferenceScreen extends StatefulWidget {
  const PreferenceScreen({Key? key}) : super(key: key);

  @override
  State<PreferenceScreen> createState() => PreferenceScreenState();
}

class PreferenceScreenState extends State<PreferenceScreen> {
  List<int> prefresults = [];
  var prefmovie;
  List<int> preferredMovieList = [
    8844,
    9691,
    11443,
    117164,
    9089,
    11525,
    46785,
    12158,
    96357,
  ];

  @override
  void initState() {
    prefmovie = MongoDatabase.preferredMovies(preferredMovieList);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        extendBodyBehindAppBar: true,
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background_login.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 70,
                ),
                Container(
                  padding: const EdgeInsets.all(24),
                  child: Column(children: const [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Select 3 or more of your favourites to continue",
                        style: TextStyle(
                            fontSize: 28,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ]),
                ),
                Container(
                  height: 500,
                  padding: const EdgeInsets.all(30),
                  child: FutureBuilder(
                    future: prefmovie,
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SizedBox(
                          height: 190,
                          width: 125,
                          child:
                              const Center(child: CircularProgressIndicator()),
                        );
                      } else {
                        return GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 25,
                            childAspectRatio: 0.67,
                          ),
                          shrinkWrap: true,
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            final content = getMoviesModel.fromJson(snapshot.data[index]);
                            return InkWell(
                              onTap: () {
                                prefresults.add(content.tmdbId);
                                MongoDatabase.addRating(content.tmdbId, 5);
                              },
                              child: Container(
                                height: 120,
                                width: 100,
                                decoration:  BoxDecoration(
                                  border: Border.all(width: 2, color: Colors.white),
                                  borderRadius: BorderRadius.all(Radius.circular(10)),),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    'https://image.tmdb.org/t/p/w600_and_h900_bestv2${content.posterPath}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (prefresults.length > 3){
                            sign = false;
                          }
                        });
                        FirebaseAuth.instance.currentUser?.reload();
                        Navigator.pushNamed(context, '/home_screen');
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 15.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        backgroundColor: Colors.white,
                      ),
                      child: Center(
                        child: Text("Continue",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ),
                    ),
                  ],
                ),
              ],
            )));
  }
}
