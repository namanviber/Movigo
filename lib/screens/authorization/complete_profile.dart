import 'package:project2/screens/authorization/sign_up_screen.dart';
import 'package:project2/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class completeProfile extends StatefulWidget {
  const completeProfile({Key? key}) : super(key: key);

  @override
  State<completeProfile> createState() => _completeProfileState();
}

class _completeProfileState extends State<completeProfile> {
  final _name = TextEditingController();
  final _age = TextEditingController();
  final _gender = TextEditingController();
  final _mobile = TextEditingController();
  final user = FirebaseAuth.instance.currentUser!;

  @override
  void dispose() {
    _name.dispose();
    _age.dispose();
    _gender.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background_login.png'),
            fit: BoxFit.cover,
          ),
        ),
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
                    "Complete Your profile ",
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
              ]),
            ),
            Column(children: [
              Container(
                padding: const EdgeInsets.all(30),
                child: Column(children: [
                  TextFormField(
                    controller: _name,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 10.0),
                      hintText: "Name",
                      hintStyle:
                          const TextStyle(fontFamily: "Inter", fontSize: 14),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 120,
                        child: TextField(
                          controller: _age,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 10.0),
                            hintText: "Age",
                            hintStyle:
                            const TextStyle(fontFamily: "Inter", fontSize: 14),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20
                      ),
                      // GENDER
                      SizedBox(
                        width: 120,
                        child: TextField(
                          controller: _gender,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 10.0),
                            hintText: "Gender",
                            hintStyle:
                            const TextStyle(fontFamily: "Inter", fontSize: 14),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _mobile,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 10.0),
                      hintText: "Phone",
                      hintStyle:
                      const TextStyle(fontFamily: "Inter", fontSize: 14),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  const SizedBox(
                    height: 120,
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // insertDB(user.uid.toString(), _name.text.trim(),
                          //     user.email.toString(), int.parse(_age.text.trim()),
                          //     _gender.text.trim());
                          setState(() {
                            sign=false;
                          });
                          FirebaseAuth.instance.currentUser?.reload();
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 15.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          primary: Colors.white,
                        ),
                        child: Center(
                          child: Text("Continue",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.montserrat(
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
                ]),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
