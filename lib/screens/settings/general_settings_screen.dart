import 'package:flutter/material.dart';
import 'package:project2/widgets/bottom_bar.dart';

class GeneralSettingsScreen extends StatelessWidget {

  int screen_index = 4;

  String dropdownvalue = 'Always';

  // List of items in our dropdown menu
  var items = ['Always', 'Never'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "General Settings",
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
              //#2
              SizedBox(
                height: 60,
                width: double.maxFinite,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.language_outlined,
                      color: Theme.of(context).iconTheme.color,
                      size: 34,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: 60,
                      width: 220,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Language",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).textTheme.titleLarge!.color,
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "English ( United States )",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).textTheme.titleLarge!.color,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 60,
                width: double.maxFinite,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.clear_all,
                      color: Theme.of(context).iconTheme.color,
                      size: 34,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: 60,
                      width: 240,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Clear Cache Memory",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).textTheme.titleLarge!.color,
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 60,
                width: double.maxFinite,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.password,
                      color: Theme.of(context).iconTheme.color,
                      size: 34,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: 60,
                      width: 240,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Forget Password",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).textTheme.titleLarge!.color,
                            ),
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
