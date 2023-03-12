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
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text("$heading",
                    style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.bold,
                        fontSize: fontsize)),
              ),
              InkWell(
                onTap: (){},
                child: Text("See all",
                    style: TextStyle(
                        fontFamily: "Inter",
                        color: Color(0xFFA0A0A0),
                        fontWeight: FontWeight.bold,
                        fontSize: fontsize)),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
