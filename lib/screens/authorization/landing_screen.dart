import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
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
              Text("Hi There !",
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.bold,
                      fontSize: 30)),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(children: [
              const SizedBox(
                height: 30,
              ),
              Center(
                  child: Image.asset(
                'assets/images/splash_image.png',
                height: 240,
              )),
              const SizedBox(
                height: 30,
              ),
              const Text("Movie Recommendations, Simplified.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: 1.4,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.bold,
                      fontSize: 26)),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 230,
                child: const Text(
                    "Get personalised movie recommendations based on your tastes and preferences.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.grey,
                        height: 1.4,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.normal,
                        fontSize: 16)),
              ),
              const SizedBox(
                height: 80,
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login_screen');
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 15.0), backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
                    child: Center(
                      child: Text("Sign In",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup_screen');
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      side: const BorderSide(color: Colors.white),
                      backgroundColor: Colors.transparent,
                    ),
                    child: Center(
                      child: Text("Sign Up",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ));
  }
}
