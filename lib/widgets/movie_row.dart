import 'package:flutter/material.dart';

class MovieRow extends StatefulWidget {
  const MovieRow({Key? key}) : super(key: key);

  @override
  State<MovieRow> createState() => _MovieRowState();
}

class _MovieRowState extends State<MovieRow> {
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
      onTap: (){},
      child: Container(
        height: 250,
        width: double.maxFinite,
        child: ListView.builder(
          itemCount: 10,
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
    );
  }
}
