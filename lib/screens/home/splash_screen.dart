import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import '../../utilities/Check.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return AnimatedSplashScreen(
      splash: Image.asset('assets/images/movigo_logo.png'),
      splashIconSize: 350,
      nextScreen: Check(),
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      duration: 2000,
    );
  }
}