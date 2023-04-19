import 'package:flutter/material.dart';
import 'package:project2/screens/home/home_screen.dart';
import 'package:project2/screens/authorization/login_screen.dart';
import 'package:project2/screens/authorization/sign_up_screen.dart';

class Authpage extends StatefulWidget {
  const Authpage({Key? key}) : super(key: key);

  @override
  State<Authpage> createState() => _AuthpageState();
}

class _AuthpageState extends State<Authpage> {
  bool showLogin = true;

  void toggle() {
    setState(() {
      showLogin =! showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLogin) {
      return LoginScreen(showSignup: toggle);
    } else {
      return SignUp(showLogin: toggle);
    }
  }
}
