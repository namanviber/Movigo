import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bottom_bar.dart';

class GridOfGenre extends StatefulWidget {
  const GridOfGenre({Key? key}) : super(key: key);

  @override
  State<GridOfGenre> createState() => _GridOfGenreState();
}

class _GridOfGenreState extends State<GridOfGenre> {
  @override
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
    'Sex',
    'Comedy',
    'Action',

  ];

  double height_for_colorbox=130;
  // Widget ColorBox(int index) {
  //   final genreListImage=genrelistofimage[index];
  //   print(genreListImage);
  //
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 6.0),
  //     child: InkWell(
  //       onTap: (){
  //         Navigator.pushNamed(context, '/filter_results', arguments: 'genrelist[i');
  //       },
  //       child: Container(
  //         width: MediaQuery.of(context).size.width-30,
  //         height: height_for_colorbox,
  //         child: Stack(
  //           children: [
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.start,
  //               children: [
  //                 Container(
  //                   width: MediaQuery.of(context).size.width - 30,
  //                   height: height_for_colorbox,
  //                   decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(11.0),
  //                     boxShadow: [
  //                       BoxShadow(
  //                         color: Colors.black.withOpacity(0.1),
  //                         blurRadius: 4.0,
  //                         offset: Offset(0, 2),
  //                       ),
  //                     ],
  //
  //                     image: DecorationImage(
  //                       image: AssetImage(genreListImage),
  //                       fit: BoxFit.cover,
  //                       // adjust the image fit as needed
  //                     ),
  //                   ),
  //                 )
  //               ],
  //             ),
  //             Positioned.fill(
  //               left: 10,
  //               // bottom: 0,
  //               top: 80,
  //               // top:10,
  //               // top: height_for_colorbox-25,
  //               child: Text(
  //                 genrelist[index],
  //                 style: TextStyle(
  //                   color: Colors.white,
  //                   fontSize: 28.0,
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Two color boxes per row
          crossAxisSpacing: 6.0, // Gap of 6 between each row
          mainAxisSpacing: 6.0, // Gap of 6 between each color box
          childAspectRatio: 1.5, // Set the aspect ratio to 1 to make each box square
        ),
        itemCount: genrelist.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/filter_results', arguments: genrelist[index]);
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
