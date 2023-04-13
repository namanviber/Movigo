import 'package:flutter/material.dart';
import 'package:project2/screens/general_settings_screen.dart';
import 'package:project2/screens/about_us_screen.dart';
import 'package:project2/screens/privacy_policy_screen.dart';
import 'package:project2/widgets/bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int screen_index = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 60,
        backgroundColor: const Color(0xFF09090F),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Settings",
                style: TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.bold,
                    fontSize: 24)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xFF043E4F),
                    borderRadius: BorderRadius.circular(10)),
                height: 80,
                width: double.maxFinite,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Center(
                            child: SizedBox(
                              width: 200,
                              height: 200,
                              child: ClipOval(
                                child: Image.asset("assets/images/testimg2.png"),
                              ),
                            ))),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 60,
                      width: 240,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "NMJ",
                            style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "namanviber@gmail.com",
                            style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                letterSpacing: 0.8),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.edit),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              //#1
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, '/profile_edit');
                },
                child: Container(
                  height: 60,
                  width: 390,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.account_circle_outlined,
                        size: 34,
                        color: Color(0xFF2196F3),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 60,
                        width: 270,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "My Account",
                              style: TextStyle(
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Make changes to your account",
                              style: TextStyle(
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios_rounded)
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/general_setting');
                },
                child: Container(
                  height: 60,
                  width: double.maxFinite,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.settings_outlined,
                        size: 34,
                        color: Color(0xFF2196F3),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 60,
                        width: 270,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "General",
                              style: TextStyle(
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Manage your General settings",
                              style: TextStyle(
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              //#2
              Container(
                height: 60,
                width: double.maxFinite,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(
                      Icons.rate_review,
                      size: 34,
                      color: Color(0xFF2196F3),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 60,
                      width: 270,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Ratings and Reviews",
                            style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Manage your ratings and reviews",
                            style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios_rounded)
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 60,
                width: double.maxFinite,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(
                      Icons.room_preferences,
                      size: 34,
                      color: Color(0xFF2196F3),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 60,
                      width: 270,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Set your Preferences",
                            style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Setup your preferences again",
                            style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios_rounded)
                  ],
                ),
              ),
              //#3

              const SizedBox(
                height: 10,
              ),
              //#5
              Container(
                height: 60,
                width: double.maxFinite,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(
                      Icons.exit_to_app_outlined,
                      size: 34,
                      color: Color(0xFF2196F3),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () {
                        FirebaseAuth.instance.signOut();
                        Navigator.pushNamed(context, '/check');
                      },
                      child: Container(
                        height: 60,
                        width: 270,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Log Out",
                              style: TextStyle(
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Log out of your account",
                              style: TextStyle(
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios_rounded)
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              //#6
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/about_us');
                },
                child: Container(
                  height: 60,
                  width: double.maxFinite,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.help_outline_outlined,
                        size: 34,
                        color: Color(0xFF2196F3),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 60,
                        width: 270,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "About Us",
                              style: TextStyle(
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              //#7
              InkWell(
                onTap: () {
                 Navigator.pushNamed(context, '/privacy_policy');
                },
                child: Container(
                  height: 60,
                  width: double.maxFinite,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.shield_outlined,
                        size: 34,
                        color: Color(0xFF2196F3),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 60,
                        width: 270,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Privacy Policy",
                              style: TextStyle(
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigation(
      //   screen_index: 3,
      // ),
    );
  }
}