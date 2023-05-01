import 'package:flutter/material.dart';
import 'package:project2/service/mongoDbCall.dart';

import 'bottom_bar.dart';
import 'item_grid.dart';

class GridOfGenre extends StatelessWidget {
  GridOfGenre({Key? key}) : super(key: key);

  List genrelistofimage=[
    'assets/images/square (1).png',
    'assets/images/square (2).png',
    'assets/images/square (3).png',
    'assets/images/square (4).png',
    'assets/images/square (5).png',
    'assets/images/square (6).png',
    'assets/images/square (7).png',
    'assets/images/square (8).png',
    'assets/images/square (9).png',
    'assets/images/square (10).png',
    'assets/images/square (11).png',
    'assets/images/square (12).png',


  ]
  ;

  List genrelist=[ 'Action',
    'Fantasy',
    'Horror',
    'Romance',
    'Animation',
    'Crime',
    'Drama',
    'Documentry',
    'Sci-fi',
    'Fresh',
    'Comedy',
    'Thriller',

  ];

  List genreFunction=[
    MongoDatabase.getActionMovies(),
    MongoDatabase.getFantasyMovies(),
    MongoDatabase.getHorrorMovies(),
    MongoDatabase.getRomanceMovies(),
    MongoDatabase.getAnimationMovies(),
    MongoDatabase.getCrimeMovies(),
    MongoDatabase.getDramaMovies(),
    MongoDatabase.getMusicalMovies(),
    MongoDatabase.getScifiMovies(),
    MongoDatabase.getKidsMovies(),
    MongoDatabase.getComedyMovies(),
    MongoDatabase.getThrillerMovies(),

  ];

  double height_for_colorbox=130;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
        title: Text('Genres Galore'),
        toolbarHeight: 60,
      ),
      body: GridView.builder(scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Two color boxes per row
          crossAxisSpacing: 6.0, // Gap of 6 between each row
          mainAxisSpacing: 10.0, // Gap of 6 between each color box
          childAspectRatio: 1.5, // Set the aspect ratio to 1 to make each box square
        ),
        itemCount: genrelist.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
    Navigator.push(context,
    MaterialPageRoute(builder: (context) => ItemGrid(heading: genrelist[index], movies: genreFunction[index])));
    },

            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4.0,
                    offset: Offset(0, 2),
                  ),
                ],
                image: DecorationImage(
                  image: AssetImage(genrelistofimage[index] ,),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    left: 10,
                    top: 80,
                    // bottom: 0,
                    child: Text(
                      genrelist[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigation(
        screen_index: 1,
      ),
    );
  }
}
