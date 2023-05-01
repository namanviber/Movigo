import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project2/utilities/auth_google.dart';
import 'package:email_validator/email_validator.dart';
import 'package:project2/screens/settings/general_settings_screen.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback showSignup;
  const LoginScreen({Key? key, required this.showSignup}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool showtext = true;

  Future log_in() async {
    try {
      FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email.text.trim(), password: _password.text.trim());
    } on FirebaseAuthException catch (e) {
      return Text("Credientials donot match", style: TextStyle(color: Colors.white),);
    }
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      body: Container(
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
                child: Column(children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Let's get you signed in. ",
                      style: TextStyle(
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
                      "Welcome Back.\nYou've been missed! ",
                      style: TextStyle(
                          height: 1.2,
                          fontSize: 26,
                          color: Colors.white,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ]),
              ),
              Column(children: [
                Container(
                  padding: const EdgeInsets.all(30),
                  child: Form(
                    key: formKey,
                    child: Column(children: [
                      TextFormField(
                        controller: _email,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          errorStyle: TextStyle(color: Colors.white),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 10.0),
                          hintText: "Enter Email address",
                          hintStyle: const TextStyle(
                              fontSize: 14, color: Colors.white),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty &&
                              !EmailValidator.validate(value)) {
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
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            errorStyle: TextStyle(color: Colors.white),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 10.0),
                            hintText: "Enter Password",
                            hintStyle: const TextStyle(
                                fontSize: 14, color: Colors.white),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    showtext = !showtext;
                                  });
                                },
                                child: Icon(
                                  Icons.remove_red_eye_outlined,
                                  color:
                                      (showtext) ? Colors.grey : Colors.white,
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
                                        GeneralSettingsScreen()));
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 100,
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
                              backgroundColor: Colors.white,
                            ),
                            child: Center(
                              child: Text("Sign in",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
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
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: widget.showSignup,
                        child: RichText(
                          text: TextSpan(children: const [
                            TextSpan(
                              text: "Don’t have an account? ",
                              style: TextStyle(fontSize: 12),
                            ),
                            TextSpan(
                              text: "Sign Up",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ]),
                        ),
                      ),
                    ]),
                  ),
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
