import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';

void showRatingDialog(BuildContext context) {
  final _dialog = RatingDialog(
    initialRating: 1.0,
    // your app's name?
    title: Text(
      'Ratings',
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black
      ),
    ),
    // encourage your user to leave a high rating?
    message: Text(
      'Rate the likeability of this Movie ( 1-5 ):',
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 15,
      color: Colors.black),
    ),
    // your app's logo?
    image: const FlutterLogo(size: 100),
    submitButtonText: 'Submit',
    commentHint: 'Set your custom comment hint',
    onCancelled: () => print('cancelled'),
    onSubmitted: (response) {
      print('rating: ${response.rating}, comment: ${response.comment}');

      // // TODO: add your own logic
      // if (response.rating < 3.0) {
      //   // send their comments to your email or anywhere you wish
      //   // ask the user to contact you instead of leaving a bad review
      // } else {
      //   _rateAndReviewApp();
      // }
    },
  );


  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => _dialog,
  );
}
