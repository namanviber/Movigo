import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project2/models/getMoviesModel.dart';
import 'package:project2/screens/authorization/sign_up_screen.dart';
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
    19995
  ];
  bool isSelected = false;

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
              height: 50,
            ),
            Container(
              padding: const EdgeInsets.all(24),
              child: Column(children: const [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Select 3 or more which you would like to rate 5",
                    style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ]),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              padding: const EdgeInsets.all(30),
              child: FutureBuilder(
                future: prefmovie,
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SizedBox(
                      height: 190,
                      width: 125,
                      child: const Center(child: CircularProgressIndicator()),
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
                        isSelected = prefresults.contains(content.tmdbId);
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (prefresults.contains(content.tmdbId)) {
                                prefresults.remove(content.tmdbId);
                                print(prefresults);
                              } else {
                                prefresults.add(content.tmdbId);
                                print(prefresults);
                              }
                            });
                          },
                          child: Container(
                            height: 120,
                            width: 100,
                            decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.network(
                                    'https://image.tmdb.org/t/p/w600_and_h900_bestv2${content.posterPath}',
                                    fit: BoxFit.cover,
                                    height: double.infinity,
                                    width: MediaQuery.of(context).size.width,
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.check_box,
                                      color: isSelected ? Colors.blue : Colors.white,
                                      size: 24,
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(vertical: 3),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              if (prefresults.length > 2) {
                sign = false;
                for (int i = 0; i < prefresults.length; i++){
                  MongoDatabase.addRating(prefresults[i], 5);
                }
                Navigator.pushNamed(context, '/home_screen');
              }
              else{
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Please select at least 3 items'),
                    duration: const Duration(seconds: 2),
                  ),
                );
              }
              FirebaseAuth.instance.currentUser?.reload();
            });
          },
          style: ElevatedButton.styleFrom(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              backgroundColor: Colors.white,
              fixedSize: Size(MediaQuery.of(context).size.width * 0.6, 50)),
          child: Text("Continue",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
