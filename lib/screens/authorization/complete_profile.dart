import 'package:mongo_dart/mongo_dart.dart' as M;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project2/service/mongoDbCall.dart';
import '../../models/getUserDetails.dart';

class completeProfile extends StatefulWidget {
  const completeProfile({Key? key}) : super(key: key);

  @override
  State<completeProfile> createState() => _completeProfileState();
}

class _completeProfileState extends State<completeProfile> {
  final _name = TextEditingController();
  final _age = TextEditingController();
  var _gender;
  final _region = TextEditingController();
  final user = FirebaseAuth.instance.currentUser!;
  final List<String> _genderOptions = ['Male', 'Female', 'Other'];

  @override
  void dispose() {
    _name.dispose();
    _age.dispose();
    _region.dispose();
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
                child: Column(children: const [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Complete Your profile ",
                      style: TextStyle(
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
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        errorStyle: TextStyle(color: Colors.white),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 10.0),
                        hintText: "Name",
                        hintStyle:
                            const TextStyle(fontSize: 14, color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(15),
                        ),
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
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 10.0),
                              hintText: "Age",
                              hintStyle: const TextStyle(
                                  color: Colors.white, fontSize: 14),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        // GENDER
                        SizedBox(
                          width: 120,
                          child: DropdownButtonFormField<String>(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 10.0),
                              hintText: "Gender",
                              hintStyle: const TextStyle(
                                  color: Colors.white, fontSize: 14),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            items: _genderOptions.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(
                                      color: Theme.of(context).indicatorColor),
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _gender = value;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _region,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 10.0),
                        hintText: "Country",
                        hintStyle:
                            const TextStyle(color: Colors.white, fontSize: 14),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 120,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        var _id = M.ObjectId();
                        final data = getUserDetails(
                            firebaseId: user.uid.toString(),
                            id: _id,
                            name: _name.text.trim(),
                            emailId: user.email.toString(),
                            age: int.parse(_age.text.trim()),
                            gender: _gender,
                            region: _region.text.trim());
                        MongoDatabase.addUserData(data);
                        Navigator.pushNamed(context, '/preference_screen');
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 15.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        backgroundColor: Colors.white,
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
                    const SizedBox(
                      height: 20,
                    ),
                  ]),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
