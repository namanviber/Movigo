import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

bool sign = false;

class SignUp extends StatefulWidget {
  final VoidCallback showLogin;
  const SignUp({Key? key, required this.showLogin}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
            email: _email.text.trim(), password: _password.text.trim());
      } on FirebaseAuthException catch (e) {
        print(e);
      }
    }
  }

  signupconfirm() async {
    await sign_up();
    setState(() {
      sign = true;
    });
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _confirmpassword.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
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
                        height: 15,
                      ),
                      TextFormField(
                        scrollPadding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        controller: _confirmpassword,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            errorStyle: TextStyle(color: Colors.white),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 10.0),
                            hintText: "Confirm Password",
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
                                    showtextconfirm = !showtextconfirm;
                                  });
                                },
                                child: Icon(
                                  Icons.remove_red_eye_outlined,
                                  color:
                                      (showtextconfirm) ? Colors.grey : Colors.white,
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
                            onPressed: signupconfirm,
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30.0, vertical: 15.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              backgroundColor: Colors.white,
                            ),
                            child: Center(
                              child: Text("Sign Up",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: widget.showLogin,
                        child: RichText(
                          text: TextSpan(children: const [
                            TextSpan(
                              text: "Already have an account? ",
                              style: TextStyle(fontSize: 12),
                            ),
                            TextSpan(
                              text: "Sign In",
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
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
