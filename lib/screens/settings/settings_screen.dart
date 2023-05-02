import 'package:flutter/material.dart';
import 'package:project2/service/mongoDbCall.dart';
import 'package:project2/widgets/bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project2/utilities/themechanger.dart';
import 'package:provider/provider.dart';
import 'package:project2/models/getUserDetails.dart';

class SettingsScreen extends StatelessWidget {
  int screen_index = 4;
  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Settings"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              FutureBuilder(
                future: MongoDatabase.getUserData(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    var content = getUserDetails.fromJson(snapshot.data);
                    return Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).highlightColor,
                          borderRadius: BorderRadius.circular(10)),
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            backgroundColor: Theme.of(context).cardColor,
                            radius: 28,
                            child: Text(
                              content.emailId[0].toUpperCase(),
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Theme.of(context).textTheme.titleSmall!.color),
                            ),
                          ),
                          SizedBox(
                            height: 60,
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  content.name ?? "User",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .color),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  content.emailId,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .color),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/profile_edit');
                              },
                              icon: Icon(
                                Icons.edit,
                                color: Theme.of(context).cardColor,
                              ))
                        ],
                      ),
                    );
                  }
                  return CircularProgressIndicator();
                },
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.ac_unit,
                      color: Theme.of(context).iconTheme.color,
                      size: 34,
                    ),
                    SizedBox(
                      height: 60,
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Theme",
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
                            "Manage Light and Dark Theme",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color:
                                  Theme.of(context).textTheme.titleLarge!.color,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Transform.scale(
                      scale: 1.5,
                      child: Switch(
                        activeThumbImage: NetworkImage(
                            'https://w7.pngwing.com/pngs/163/715/png-transparent-dark-mode-moon-night-forecast-weather-multimedia-solid-px-icon.png'),
                        activeTrackColor: Colors.white,
                        activeColor: Colors.white,
                        inactiveThumbImage: NetworkImage(
                            'https://static.thenounproject.com/png/4514193-200.png'),
                        inactiveTrackColor: Colors.black,
                        inactiveThumbColor: Colors.white,
                        value: Provider.of<ThemeChanger>(context, listen: false)
                            .isDarkModeon,
                        onChanged: (boolVal) {
                          Provider.of<ThemeChanger>(context, listen: false)
                              .updateTheme(boolVal);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/general_setting');
                },
                child: SizedBox(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.settings_outlined,
                        size: 34,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      SizedBox(
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "General Settings",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .color,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Manage your General Settings",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .color,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios_rounded)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushReplacementNamed(context, '/check');
                },
                child: SizedBox(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.logout,
                        size: 34,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      SizedBox(
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Sign Out",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .color,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Sign Out from your account",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .color,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios_rounded)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/about_us');
                },
                child: SizedBox(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.info_outline_rounded,
                        size: 34,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      SizedBox(
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "About Us",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .color,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "About the Developers of App",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .color,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios_rounded)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/privacy_policy');
                },
                child: SizedBox(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.shield_outlined,
                        size: 34,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      SizedBox(
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Privacy Policy",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .color,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Privacy Policies of our app",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .color,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios_rounded)
                    ],
                  ),
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
