import 'package:flutter/material.dart';
import 'package:project2/widgets/bottom_bar.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  int screen_index = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 60,
          backgroundColor: const Color(0xFF09090F),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("About Us",
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.bold,
                      fontSize: 24)),
            ],
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 360,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "This application is our course project for the PROJECT 2 course"
                      "\n\nGroup Members",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      children: [
                        Container(
                          height: 60,
                          width: 390,
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              //1
                              CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: Center(
                                      child: SizedBox(
                                    width: 200,
                                    height: 200,
                                    child: ClipOval(
                                      child: Image.asset(
                                          "assets/images/testimg2.png"),
                                    ),
                                  ))),
                              const SizedBox(
                                width: 30,
                              ),
                              Container(
                                height: 60,
                                width: 270,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "Naman Jain",
                                      style: TextStyle(
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 60,
                          width: 390,
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              //1
                              CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: Center(
                                      child: SizedBox(
                                    width: 200,
                                    height: 200,
                                    child: ClipOval(
                                      child: Image.asset(
                                          "assets/images/testimg2.png"),
                                    ),
                                  ))),
                              const SizedBox(
                                width: 30,
                              ),
                              Container(
                                height: 60,
                                width: 270,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "Aryaman Sital",
                                      style: TextStyle(
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 60,
                          width: 390,
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              //1
                              CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: Center(
                                      child: SizedBox(
                                    width: 200,
                                    height: 200,
                                    child: ClipOval(
                                      child: Image.asset(
                                          "assets/images/testimg2.png"),
                                    ),
                                  ))),
                              const SizedBox(
                                width: 30,
                              ),
                              Container(
                                height: 60,
                                width: 270,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "Dhaval Pathak",
                                      style: TextStyle(
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 60,
                          width: 390,
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              //1
                              CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: Center(
                                      child: SizedBox(
                                    width: 200,
                                    height: 200,
                                    child: ClipOval(
                                      child: Image.asset(
                                          "assets/images/testimg2.png"),
                                    ),
                                  ))),
                              const SizedBox(
                                width: 30,
                              ),
                              Container(
                                height: 60,
                                width: 270,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "Naman Khandelwal",
                                      style: TextStyle(
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 60,
                          width: 390,
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              //1
                              CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: Center(
                                      child: SizedBox(
                                    width: 200,
                                    height: 200,
                                    child: ClipOval(
                                      child: Image.asset(
                                          "assets/images/testimg2.png"),
                                    ),
                                  ))),
                              const SizedBox(
                                width: 30,
                              ),
                              Container(
                                height: 60,
                                width: 270,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "Priyansh Tyagi",
                                      style: TextStyle(
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 60,
                          width: 390,
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              //1
                              CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: Center(
                                      child: SizedBox(
                                    width: 200,
                                    height: 200,
                                    child: ClipOval(
                                      child: Image.asset(
                                          "assets/images/testimg2.png"),
                                    ),
                                  ))),
                              const SizedBox(
                                width: 30,
                              ),
                              Container(
                                height: 60,
                                width: 270,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "Sidharth Aggarwal",
                                      style: TextStyle(
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 60,
                          width: 390,
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              //1
                              CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: Center(
                                      child: SizedBox(
                                    width: 200,
                                    height: 200,
                                    child: ClipOval(
                                      child: Image.asset(
                                          "assets/images/testimg2.png"),
                                    ),
                                  ))),
                              const SizedBox(
                                width: 30,
                              ),
                              Container(
                                height: 60,
                                width: 270,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "Soum Nag",
                                      style: TextStyle(
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ]),
          ),
        ),
        bottomNavigationBar: BottomNavigation(
          screen_index: 3,
        ));
  }
}
