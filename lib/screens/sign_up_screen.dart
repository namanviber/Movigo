import 'package:flutter/material.dart';
import 'package:project2/authorization/auth_google.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'package:project2/models/MongoDbModel.dart';
import 'package:project2/authorization/mongodb.dart';
import 'package:google_fonts/google_fonts.dart';

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

  // Future<void> _insertData() async {
  //   final data = MongoDbModel(email: "namanviber@gmail.com", password: "Naman@123", name: "Naman Jain", phoneNumber: 8307607758, username: "namanviber", gender: "Male", age: 20);
  //   var result = await MongoDatabase.insert(data);
  // }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/background_login.png'),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // extendBodyBehindAppBar: true,
        // resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.fromLTRB(16, 200, 16, 16),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _email,
                      decoration: const InputDecoration(
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
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: _password,
                      scrollPadding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
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
                                color: Colors.white,
                              ))),
                      obscureText: showtext,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password cannot be empty";
                        }
                        return null;
                      },
                      onChanged: (value) {},
                    ),
                    const SizedBox(
                      height: 30,
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
                              child:
                                  const Icon(Icons.remove_red_eye_outlined))),
                      obscureText: showtextconfirm,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "This Field cannot be empty";
                        } else {
                          if (_confirmpassword != _password) {
                            return "Password donot match";
                          }
                          return null;
                        }
                      },
                      onChanged: (value) {},
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 470),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // _insertData();
                    },
                    child: Container(
                      height: 50,
                      width: 300,
                      child: const Center(
                        child: Text(
                          "SignUp",
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
                  const Text(
                    "or SignUp with ",
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
                  const InkWell(
                    child: Text(
                      "Already have a account? Log In",
                      style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
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
