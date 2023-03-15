import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project2/authorization/auth_google.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _email = TextEditingController();
  final _password = TextEditingController();


  Future log_in () async{
    FirebaseAuth.instance.signInWithEmailAndPassword(email: _email.text.trim(), password: _password.text.trim());
  }


  @override

  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
        body: Container(
      height: double.maxFinite,
      width: double.maxFinite,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background_login.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          TextFormField(controller: _email,
            decoration: InputDecoration(
              hintText: "Enter username or email address",
              labelText: "Username / Email",
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "Username cannot be empty";
              }
              return null;
            },
            onChanged: (value) {},
          ),
          SizedBox(
            height: 30,
          ),
          TextFormField(controller: _password,
            decoration: InputDecoration(
              hintText: "Enter Password",
              labelText: "Password",
            ),
            obscureText: true,
            validator: (value) {
              if (value!.isEmpty) {
                return "Password cannot be empty";
              }
              return null;
            },
            onChanged: (value) {},
          ),
          const SizedBox(
            height: 20,
          ),
          const Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              child: Text(
                "Forgot Password?",
                style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: log_in,
            child: Container(
              height: 50,
              width: double.maxFinite,
              child: Center(
                child: Text(
                  "Login",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "or continue with ",
            style: TextStyle(
                fontFamily: "Inter",
                fontSize: 10,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Auth_Google().signInwithGoogle();
                },
                child: Container(
                  child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: SizedBox(
                          width: 60,
                          height: 60,
                          child: ClipOval(
                            child: Image.asset("assets/images/google_logo.png"),
                          ))),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: SizedBox(
                          width: 60,
                          height: 60,
                          child: ClipOval(
                            child:
                                Image.asset("assets/images/facebook_logo.png"),
                          ))),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: SizedBox(
                          width: 60,
                          height: 60,
                          child: ClipOval(
                            child: Image.asset("assets/images/github_logo.png"),
                          ))),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          InkWell(
            child: Text(
              "Didn't have account? Sign up",
              style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 38,
          ),
        ]),
      ),
    ));
  }
}
