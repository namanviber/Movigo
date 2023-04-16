// import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:project2/models/mongoDbModels/getMoviesModel.dart';
import 'package:project2/models/apiModels/DiscoverMovieModel.dart';

class MovieCard extends StatelessWidget {
  final DiscoverMovieModel movie;
  // final getMoviesModel movie;
  const MovieCard({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final posterUrl =
        'https://image.tmdb.org/t/p/w600_and_h900_bestv2${movie.posterPath}';

    return Card(
      elevation: 3.0,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              posterUrl,
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              icon: Icon(
                Icons.bookmark,
                size: 28,
                color: Color(0xFF6280CC),
              ),
              onPressed: () {},
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.7),
                  ],
                ),
              ),
              padding: EdgeInsets.all(10.0),
              child: Text(
                movie.title,
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ),
        ],
      ),
    );

  }
}
//
//   Widget build(BuildContext context) {
//     final posterUrl =
//         'https://image.tmdb.org/t/p/w600_and_h900_bestv2${movie.posterPath}';
//     return Container(
//       height: 150,
//       width: double.maxFinite,
//       margin: const EdgeInsets.symmetric(horizontal: 5),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             height: 130,
//             width: 100,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 fit: BoxFit.cover,
//                 image: posterUrl != ''
//                     ? NetworkImage(posterUrl)
//                     : AssetImage('assets/images/noimage.png') as ImageProvider,
//               ),
//             ),
//           ),
//           const SizedBox(
//             width: 20,
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 movie.title != '' ? movie.title : "Untitled",
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontFamily: "Inter",
//                     fontSize: 11),
//                 maxLines: 3,
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Text(
//                   movie.genreIds != '' ? movie.genreIds.toString() : "Untitled",
//                   style: TextStyle(
//                       color: Colors.white, fontFamily: "Inter", fontSize: 8)),
//               const SizedBox(
//                 height: 8,
//               ),
//               Row(
//                 children: [
//                   Icon(Icons.calendar_month),
//                   SizedBox(
//                     width: 6,
//                   ),
//                   Text(
//                       movie.releaseDate != ''
//                           ? movie.releaseDate.toString()
//                           : "Untitled",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontFamily: "Inter",
//                           fontSize: 8)),
//                 ],
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
