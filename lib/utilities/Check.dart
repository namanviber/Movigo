import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project2/screens/authorization/complete_profile.dart';
import 'package:project2/screens/home/home_screen.dart';
import '../screens/authorization/sign_up_screen.dart';
import 'authPage.dart';

class Check extends StatelessWidget {
  const Check({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.userChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData && sign==false) {
            return HomeScreen();
          }
          if (snapshot.hasData && sign==true){
            return completeProfile();
          }
          else{
            return Authpage();
          }
        },
      ),
    );
  }
}
