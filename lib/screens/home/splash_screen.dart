import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project2/screens/home/home_screen.dart';

import '../../utilities/Check.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {

    return AnimatedSplashScreen(
      splash: Image.asset('assets/images/Movigo.png'),
      splashIconSize: 350,
      nextScreen: Check(),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.leftToRight,
      backgroundColor: Color(0xff09090F),
      duration: 2000,
    );
  }
}