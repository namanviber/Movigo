import 'package:flutter/material.dart';
import 'package:project2/models/MovieCastDetailsModel.dart';

class MovieCastRow extends StatelessWidget {
  const MovieCastRow({required this.model, Key? key}) : super(key: key);
  final MovieCastDetailsModel model;

  @override
  Widget build(BuildContext context) {
    final posterUrl =
        'https://image.tmdb.org/t/p/original${model.profilePath}';
    return SizedBox(
      width: 125,
      child: Column(
        children: [
          ClipRRect(
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
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              model.name.toString(),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).textTheme.titleSmall!.color,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textAlign: TextAlign.left,
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              model.character.toString(),
              style: TextStyle(
                fontSize: 10,
                color: Theme.of(context).textTheme.titleSmall!.color,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
