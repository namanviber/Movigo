import 'package:flutter/material.dart';

class TextHeading extends StatelessWidget {
  TextHeading({required this.heading, this.fontsize = 17, Key? key})
      : super(key: key);
  String? heading;
  double? fontsize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Container(
            alignment: Alignment.topLeft,
            child: Text("$heading",
                style: TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.bold,
                    fontSize: fontsize)),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
