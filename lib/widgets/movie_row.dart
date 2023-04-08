import 'package:flutter/material.dart';
import 'package:project2/models/apiModels/DiscoverMovieModel.dart';
import 'package:project2/models/apiModels/MovieDetailModel.dart';
import 'package:project2/screens/movie_info_screen.dart';
import 'package:project2/service/apiCall.dart';

class MovieRow extends StatefulWidget {
  MovieRow({required this.model, Key? key}) : super(key: key);
  final DiscoverMovieModel model;

  @override
  State<MovieRow> createState() => _MovieRowState();
}

class _MovieRowState extends State<MovieRow> {
  MovieDetailModel? movieDetail;

  Future<void> fetchMovieDetails(int movieid) async {
    final response3 = await movieDetails(movieid);
    setState(() {
      movieDetail = response3;
    });
  }

  bool statecolor = true;

  @override
  Widget build(BuildContext context) {
    final posterUrl =
        'https://image.tmdb.org/t/p/w600_and_h900_bestv2${widget.model.posterPath}';

    return FutureBuilder(
      future: fetchMovieDetails(widget.model.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return InkWell(
            onTap: () {
              print("===========================================");
              print(movieDetail);
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => MovieInfo(
              //               movieModel: movieDetail!,
              //             )));
            },
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  posterUrl,
                  fit: BoxFit.cover,
                  height: 170,
                  width: 125,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      "assets/images/noimage.png",
                      fit: BoxFit.cover,
                    );
                  },
                )),
          );
        }
      },
    );
  }
}


//     if (snapshot.hasData) {
//       return InkWell(
//         onTap: () {
//           print("===========================================");
//           print(movieDetail);
//           // Navigator.push(
//           //     context,
//           //     MaterialPageRoute(
//           //         builder: (context) => MovieInfo(
//           //               movieModel: movieDetail!,
//           //             )));
//         },
//         child: ClipRRect(
//             borderRadius: BorderRadius.circular(10.0),
//             child: Image.network(
//               posterUrl,
//               fit: BoxFit.cover,
//               height: 170,
//               width: 125,
//               errorBuilder: (context, error, stackTrace) {
//                 return Image.asset(
//                   "assets/images/noimage.png",
//                   fit: BoxFit.cover,
//                 );
//               },
//             )),
//       );
//     }
//     return Text("Some Error Occured");
//   },
// );

// return InkWell(
//   onTap: () {
//     Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => MovieInfo(
//                   movieModel: widget.model,
//                 )));
//   },
//   child: Stack(
//     children: [
//       ClipRRect(
//           borderRadius: BorderRadius.circular(10.0),
//           child: Image.network(
//             posterUrl,
//             fit: BoxFit.cover,
//             height: 170,
//             width: 125,
//             errorBuilder: (context, error, stackTrace) {
//               return Image.asset(
//                 "assets/images/noimage.png",
//                 fit: BoxFit.cover,
//               );
//             },
//           )),
//       IconButton(
//         onPressed: () {
//           setState(() {
//             statecolor = !statecolor;
//           });
//         },
//         color: (statecolor) ? Colors.white : Colors.blue,
//         icon: Icon(Icons.check_circle),
//       ),
//     ],
//   ),
// );
//   }
// }

// Align(
// alignment: Alignment.topRight,
// child: IconButton(
// onPressed: () {
// setState(() {
// statecolor = !statecolor;
// });
// },
// color: (statecolor) ? Colors.white : Colors.blue,
// icon: Icon(Icons.check_circle),
// ),
// ),
