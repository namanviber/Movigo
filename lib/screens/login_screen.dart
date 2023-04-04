import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project2/authorization/auth_google.dart';
import 'package:email_validator/email_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project2/screens/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
      print(e);
    }

  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/background_login.png'),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              height: 200,
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _email,
                      decoration: InputDecoration(
                        hintText: "Enter email address",
                        labelText: "Email",
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty && !EmailValidator.validate(value)) {
                          return "Enter valid email";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _password,
                      decoration: InputDecoration(
                          hintText: "Enter Password",
                          labelText: "Password",
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
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => SignUp()));
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: log_in,
                  child: Container(
                    height: 50,
                    width: 300,
                    child: Center(
                      child: Text("Login",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                              fontSize: 14, fontWeight: FontWeight.bold)),
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
                                  child: Image.asset(
                                      "assets/images/google_logo.png"),
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
                                  child: Image.asset(
                                      "assets/images/facebook_logo.png"),
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
                                  child: Image.asset(
                                      "assets/images/github_logo.png"),
                                ))),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUp()));
                  },
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
                            color: Colors.blue),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
