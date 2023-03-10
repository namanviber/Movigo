import 'package:flutter/material.dart';

class MovieRow extends StatelessWidget {
  MovieRow({required this.heading, Key? key}) : super(key: key);
  String heading;

  final List<List<String>> imgLists = [
    [
      'assets/images/testimg1.png',
      'assets/images/testimg3.png',
      'assets/images/testimg4.png',
      'assets/images/testimg5.png',
      'assets/images/testimg6.png',
      'assets/images/testimg7.png',
    ],
    [
      "Knock at the Cabin",
      "Plane",
      "Puss in Boots: The Last Wish",
      "Black Panther: Wakanda Forever",
      "The Eighth Clause",
      "Lord of the Streets",
    ]
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
                    fontSize: 17)),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 170,
            width: double.maxFinite,
            child: ListView.builder(
              itemCount: imgLists[0].length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, index) {
                return Column(
                  children: [
                    Container(
                      height: 170,
                      width: 125,
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(imgLists[0][index]),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
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
