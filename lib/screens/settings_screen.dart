import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:project2/widgets/bottom_bar.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _controller = ValueNotifier<bool>(false);
  int screen_index = 3;

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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: const Color(0xFF043E4F),
                  borderRadius: BorderRadius.circular(10)),
              height: 80,
              width: 350,
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Sidharth Aggarwal",
                          style: TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "sidharthaggarwal@gmail.com",
                          style: TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              letterSpacing: 0.8),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            //#1
            Container(
              height: 60,
              width: 350,
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.account_circle_outlined,
                    size: 34,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 60,
                    width: 260,
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
            const SizedBox(
              height: 10,
            ),
            //#2
            Container(
              height: 60,
              width: 350,
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.account_circle,
                    size: 34,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 60,
                    width: 260,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "My Lists",
                          style: TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Manage your saved lists",
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
            //#3
            Container(
              height: 60,
              width: 350,
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.ac_unit,
                    size: 34,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 60,
                    width: 225,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Theme",
                          style: TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Manage Light and Dark Theme",
                          style: TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  AdvancedSwitch(
                    activeChild: const Icon(
                      Icons.light_mode_outlined,
                      color: Color(0xFF2F2F2F),
                    ),
                    inactiveChild: const Icon(
                      Icons.dark_mode_outlined,
                    color: Color(0xFFECECEC),
                    ),
                    activeColor: Color(0xFFECECEC),
                    inactiveColor: const Color(0xFF2F2F2F),
                    width: 60,
                    controller: _controller,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            //#4
            Container(
              height: 60,
              width: 350,
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.settings_outlined,
                    size: 34,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 60,
                    width: 260,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Settings",
                          style: TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Manage your settings",
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
            //#5
            Container(
              height: 60,
              width: 350,
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.exit_to_app_outlined,
                    size: 34,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 60,
                    width: 260,
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
                  const Icon(Icons.arrow_forward_ios_rounded)
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            //#6
            Container(
              height: 60,
              width: 350,
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.help_outline_outlined ,
                    size: 34,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 60,
                    width: 260,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Help & Support",
                          style: TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
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
            //#7
            Container(
              height: 60,
              width: 350,
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.android_outlined,
                    size: 34,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 60,
                    width: 260,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "About App",
                          style: TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
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
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(screen_index: 3,),

    );
  }
}


