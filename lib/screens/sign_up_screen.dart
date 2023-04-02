import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project2/authorization/auth_google.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'package:project2/models/MongoDbModel.dart';
import 'package:project2/authorization/mongodb.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:email_validator/email_validator.dart';
import 'package:project2/screens/login_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

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

  // Future<void> _insertData() async {
  //   final data = MongoDbModel(email: "namanviber@gmail.com", password: "Naman@123", name: "Naman Jain", phoneNumber: 8307607758, username: "namanviber", gender: "Male", age: 20);
  //   var result = await MongoDatabase.insert(data);
  // }

  Future sign_up() async {
    final isvalid = formKey.currentState!.validate();
    if (isvalid) {
      // showDialog(context: context, builder: (context) => Center(child: CircularProgressIndicator,))

      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _email.toString().trim(),
            password: _password.toString().trim());
      } on FirebaseAuthException catch (e) {
        print(e);
      }
    }
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
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.fromLTRB(16, 200, 16, 16),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _email,
                        decoration: const InputDecoration(
                          hintText: "Enter email address",
                          labelText: "Email",
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
                      TextFormField(
                        scrollPadding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        controller: _confirmpassword,
                        decoration: InputDecoration(
                          hintText: "Enter Password",
                          labelText: "Confirm Password",
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                showtextconfirm = !showtextconfirm;
                              });
                            },
                            child: Icon(
                              Icons.remove_red_eye_outlined,
                              color: (showtextconfirm)
                                  ? Colors.grey
                                  : Colors.white,
                            ),
                          ),
                        ),
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
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 470),
              child: Column(
                children: [
                  Center(
                    child: ElevatedButton(
                      onPressed: sign_up,
                      child: Container(
                        height: 50,
                        width: 300,
                        child: Center(
                          child: Text(
                              "SignUp",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.bold)
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginScreen()));
                    },
                    child: RichText(
                      text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Already have an account? ",
                              style: GoogleFonts.montserrat(fontSize: 12),
                            ),
                            TextSpan(
                              text: "Login",
                              style: GoogleFonts.montserrat(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.blue),
                            ),
                          ]
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
