import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

class Carousel extends StatefulWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
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
    return CarouselSlider(
      items: imgLists
          .map((item) => InkWell(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => MovieInfo(
                  //               movieModel: _d,
                  //             )));
                },
                child: Center(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          item,
                          width: 180,
                          height: 245,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Black Panther",
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 22,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Color(0xff51535E),
                                borderRadius: BorderRadius.circular(5)),
                            alignment: Alignment.center,
                            child: Text(
                              "18+",
                              style: GoogleFonts.montserrat(fontSize: 13),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 22,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Color(0xff51535E),
                                borderRadius: BorderRadius.circular(5)),
                            alignment: Alignment.center,
                            child: const Text(
                              "Action",
                              style: TextStyle(
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 22,
                            width: 40,
                            decoration: BoxDecoration(
                                color: Color(0xff51535E),
                                borderRadius: BorderRadius.circular(5)),
                            alignment: Alignment.center,
                            child: const Text(
                              "Eng",
                              style: TextStyle(
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ))
          .toList(),
      options: CarouselOptions(
        autoPlayInterval: Duration(seconds: 2),
        viewportFraction: 0.55,
        height: 450,
        autoPlay: true,
        aspectRatio: 3.0,
        enlargeCenterPage: true,
      ),
    );
  }
}
