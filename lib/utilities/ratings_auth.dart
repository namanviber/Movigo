import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';
import '../service/mongoDbCall.dart';

void showRatingDialog(BuildContext context, int movieid, String title, String moviepath ) {
  final posterurl =
      'https://image.tmdb.org/t/p/original/$moviepath';
  final _dialog = RatingDialog(
    initialRating: 0,
    title: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.bold,
        color: Colors.black
      ),
    ),
    message: Text(
      'Rate this Movie',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 15,
      color: Colors.black),
    ),
    image: Image(
      image: posterurl != ''
          ? NetworkImage(
        posterurl,
      )
          : const AssetImage('assets/images/noimage.png')
      as ImageProvider,
      height: 100,
      fit: BoxFit.fitHeight,
    ),
    submitButtonText: 'Submit',
    starColor: Theme.of(context).highlightColor,
    submitButtonTextStyle: TextStyle(
      color: Theme.of(context).highlightColor
    ),
    commentHint: 'Review this Movie',
    onSubmitted: (response) {
      MongoDatabase.addRating(movieid, response.rating);
    },

  );


  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => _dialog,
  );
}
