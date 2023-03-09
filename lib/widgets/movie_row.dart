import 'package:flutter/material.dart';

class MovieRow extends StatelessWidget {
  MovieRow({required this.heading,Key? key}) : super(key: key);
  String heading;

  final List<String> imgLists = [
    'assets/images/testimg1.png',
    'assets/images/testimg3.png',
    'assets/images/testimg4.png',
    'assets/images/testimg5.png',
    'assets/images/testimg6.png',
    'assets/images/testimg7.png',
  ];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Text("$heading",
                style: TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 250,
            width: double.maxFinite,
            child: ListView.builder(
              itemCount: imgLists.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, index) {
                return Container(
                  height: 160,
                  width: 150,
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imgLists[index]),
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
