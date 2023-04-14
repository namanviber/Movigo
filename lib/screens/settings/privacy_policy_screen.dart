import 'package:flutter/material.dart';
import 'package:project2/widgets/bottom_bar.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  int screen_index = 5;

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
              Text("Privacy Policy",
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
            padding: const EdgeInsets.all(12),
            child: Column(children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                    Text(
                      "No personal data collected in this application is used for any purpose other than the scope of our coursework. This data will not be shared in any way and will be deleted after the duration of this course.",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ])),
            ]),
          ),
        ),
        bottomNavigationBar: BottomNavigation(
          screen_index: 3,
        ));
  }
}
