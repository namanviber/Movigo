import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project2/authorization/auth_google.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'package:project2/models/mongoDbModels/MongoDbModel.dart';
import 'package:project2/service/mongoDbCall.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:email_validator/email_validator.dart';
import 'package:project2/screens/authorization/login_screen.dart';
import 'package:project2/widgets/signup_widget.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {


  // Future<void> _insertData() async {
  //   final data = MongoDbModel(email: "namanviber@gmail.com", password: "Naman@123", name: "Naman Jain", phoneNumber: 8307607758, username: "namanviber", gender: "Male", age: 20);
  //   var result = await MongoDatabase.insert(data);
  // }



  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushNamed(context, "/splash_screen"),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body:
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background_login.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 120,
              ),
              Container(
                padding: const EdgeInsets.all(24),
                child: Column(children: const [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Let's get you signed up. ",
                      style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Welcome! ",
                      style: TextStyle(
                          height: 1.2,
                          fontFamily: "Inter",
                          fontSize: 26,
                          color: Colors.white,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ]),
              ),
              StreamBuilder<User?>(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  return SignupWidget();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
