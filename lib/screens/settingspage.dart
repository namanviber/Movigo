import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:project2/widgets/bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GeneralSettingsScreen extends StatefulWidget {
  const GeneralSettingsScreen({Key? key}) : super(key: key);

  @override
  State<GeneralSettingsScreen> createState() => _GeneralSettingsScreenState();
}

class _GeneralSettingsScreenState extends State<GeneralSettingsScreen> {
  final _controller = ValueNotifier<bool>(false);
  final _controller1 = ValueNotifier<bool>(false);
  int screen_index = 4;
  String dropdownvalue = 'Always';

  // List of items in our dropdown menu
  var items = [
    'Always',
    'Never'
  ];

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
            Text("General",
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
          child: Column(
            children: [

              const SizedBox(
                height: 10,
              ),
              //#1
              Container(
                height: 60,
                width: 390,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(
                      Icons.access_alarm,
                      size: 34,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 60,
                      width: 220,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Push Notifications",
                            style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          // Text(
                          //   "Manage your notifications",
                          //   style: TextStyle(
                          //       fontFamily: "Inter",
                          //       fontWeight: FontWeight.bold,
                          //       fontSize: 12),
                          // ),
                        ],
                      ),
                    ),
                    AdvancedSwitch(
                      activeChild: const Icon(
                        Icons.doorbell_outlined,
                        color: Color(0xFF4CAF50),
                      ),
                      inactiveChild: const Icon(
                        Icons.doorbell_rounded,
                        color: Color(0xFFF44336),
                      ),
                      activeColor: Color(0xFFECECEC),
                      inactiveColor: const Color(0xFF2F2F2F),
                      width: 60,
                      controller: _controller1,
                    ),
                  ],
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
                      Icons.language_outlined,
                      size: 34,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 60,
                      width: 220,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Language",
                            style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "English ( United States )",
                            style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    // DropdownButton(
                    //
                    //   // Initial Value
                    //   value: dropdownvalue,
                    //
                    //   // Down Arrow Icon
                    //   icon: const Icon(Icons.keyboard_arrow_down),
                    //
                    //   // Array list of items
                    //   items: items.map((String items) {
                    //     return DropdownMenuItem(
                    //       value: items,
                    //       child: Text(items),
                    //     );
                    //   }).toList(),
                    //   // After selecting the desired option,it will
                    //   // change button value to selected value
                    //   onChanged: (String? newValue) {
                    //     setState(() {
                    //       dropdownvalue = newValue!;
                    //     });
                    //   },
                    // ),
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
                      Icons.location_city,
                      size: 34,
                    ),
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
                            "Region",
                            style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Device Region ( India )",
                            style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    // const Icon(Icons.arrow_drop_down)

                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              //#3
              Container(
                height: 60,
                width: double.maxFinite,
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
                      width: 220,
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
        // #3
        Container(
          height: 60,
          width: double.maxFinite,
          child: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.clear_all,
                size: 34,
              ),
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
                      "Clear Cache Memory",
                      style: TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    SizedBox(
                      height: 4,
                    ),

                  ],
                ),
              ),

            ],
          ),
        ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        screen_index: 3,
      ),
    );
  }
}

//clear cache memory
//