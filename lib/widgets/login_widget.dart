import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project2/authorization/auth_google.dart';
import 'package:project2/screens/forget_password_screen.dart';
import 'package:project2/screens/sign_up_screen.dart';
import 'package:project2/screens/general_settings_screen.dart';

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool showtext = true;

  Future log_in() async {
    try {
      FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email.text.trim(), password: _password.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) => SingleChildScrollView(
          child: Column(children: [
        Container(
          padding: const EdgeInsets.all(30),
          child: Form(
            key: formKey,
            child: Column(children: [
              TextFormField(
                controller: _email,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 10.0),
                  hintText: "Enter Email address",
                  hintStyle: const TextStyle(fontFamily: "Inter", fontSize: 14),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.isEmpty && !EmailValidator.validate(value)) {
                    return "Enter valid email";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _password,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 10.0),
                    hintText: "Enter Password",
                    hintStyle:
                        const TextStyle(fontFamily: "Inter", fontSize: 14),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            showtext = !showtext;
                          });
                        },
                        child: Icon(
                          Icons.remove_red_eye_outlined,
                          color: (showtext) ? Colors.grey : Colors.white,
                        ))),
                obscureText: showtext,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.isEmpty && value.length < 8) {
                    return "Minimum 8 Characters Required";
                  }
                  return null;
                },
                onChanged: (value) {},
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const GeneralSettingsScreen()));
                  },
                ),
              ),
              const SizedBox(
                height: 120,
              ),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: log_in,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 15.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      primary: Colors.white,
                    ),
                    child: Center(
                      child: Text("Sign in",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                              fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Auth_Google().signInwithGoogle();
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 15.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                      ),
                      side: const BorderSide(color: Colors.white),
                      backgroundColor: Colors.transparent,
                    ),
                    child: Center(
                      child: Text("Continue with Google",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {Navigator.pushNamed(context, '/signup_screen');},
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: "Don’t have an account? ",
                      style: GoogleFonts.montserrat(fontSize: 12),
                    ),
                    TextSpan(
                      text: "Sign Up",
                      style: GoogleFonts.montserrat(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ]),
                ),
              ),
            ]),
          ),
        ),
      ]));
}