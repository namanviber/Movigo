import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project2/authorization/auth_google.dart';
import 'package:project2/screens/forget_password_screen.dart';
import 'package:project2/screens/sign_up_screen.dart';
import 'package:project2/screens/general_settings_screen.dart';

class SignupWidget extends StatefulWidget {
  @override
  _SignupWidgetState createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmpassword = TextEditingController();
  bool showtext = true;
  bool showtextconfirm = true;
  final formKey = GlobalKey<FormState>();

  Future sign_up() async {
    final isvalid = formKey.currentState!.validate();
    if (isvalid) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _email.toString().trim(),
            password: _password.toString().trim());
      } on FirebaseAuthException catch (e) {
        print(e);
      }
    }

    return GeneralSettingsScreen();
  }

  @override
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
              ),const SizedBox(
                height: 15,
              ),
              TextFormField(
                scrollPadding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                controller: _confirmpassword,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 10.0),
                    hintText: "Confirm Password",
                    hintStyle:
                    const TextStyle(fontFamily: "Inter", fontSize: 14),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            showtextconfirm = !showtextconfirm;
                          });
                        },
                        child: Icon(
                          Icons.remove_red_eye_outlined,
                          color: (showtextconfirm) ? Colors.grey : Colors.white,
                        ))),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                obscureText: showtextconfirm,
                validator: (value) {
                  if (value!.isEmpty && _confirmpassword != _password) {
                    return "Password donot match";
                  } else {
                    return null;
                  }
                },
              ),

              const SizedBox(
                height: 120,
              ),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: sign_up,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 15.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      primary: Colors.white,
                    ),
                    child: Center(
                      child: Text("Sign Up",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                              fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black)),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {Navigator.pushNamed(context, '/login_screen');},
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: "Already have an account? ",
                      style: GoogleFonts.montserrat(fontSize: 12),
                    ),
                    TextSpan(
                      text: "Sign In",
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
