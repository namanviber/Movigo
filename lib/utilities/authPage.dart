// import 'package:flutter/material.dart';
// import 'package:project2/screens/home_screen.dart';
// import 'package:project2/screens/sign_up_screen.dart';
// import 'package:project2/screens/login_screen.dart';
//
// class Authpage extends StatefulWidget {
//   const Authpage({Key? key}) : super(key: key);
//
//   @override
//   State<Authpage> createState() => _AuthpageState();
// }
//
// class _AuthpageState extends State<Authpage> {
//   bool showLogin = true;
//
//   void toogle() {
//     setState(() {
//       showLogin = !showLogin;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (showLogin) {
//       return LoginScreen(showSignup: toogle);
//     } else {
//       return SignUp(showLogin: toogle);
//     }
//   }
// }
