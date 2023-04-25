import 'package:flutter/material.dart';
import 'package:project2/widgets/bottom_bar.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  int screen_index = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "About Us",
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Our Story',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10.0),
                const Text(
                  "This application is our course project for the PROJECT 2 course",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 20.0),
                const Text(
                  'Our Team',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    const CircleAvatar(
                      backgroundImage:
                          NetworkImage('https://example.com/team-member-1.jpg'),
                      radius: 40.0,
                    ),
                    const SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        Text(
                          'Naman Jain',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Team Lead',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    const CircleAvatar(
                      backgroundImage:
                          NetworkImage('https://example.com/team-member-2.jpg'),
                      radius: 40.0,
                    ),
                    const SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        Text(
                          'Aryaman Sital',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Front End Lead',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    const CircleAvatar(
                      backgroundImage:
                          NetworkImage('https://example.com/team-member-2.jpg'),
                      radius: 40.0,
                    ),
                    const SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        Text(
                          'Dhaval Pathak',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Front End Lead',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    const CircleAvatar(
                      backgroundImage:
                          NetworkImage('https://example.com/team-member-2.jpg'),
                      radius: 40.0,
                    ),
                    const SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        Text(
                          'Sidharth Aggarwal',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Front End Lead',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    const CircleAvatar(
                      backgroundImage:
                          NetworkImage('https://example.com/team-member-2.jpg'),
                      radius: 40.0,
                    ),
                    const SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        Text(
                          'Priyansh Tyagi',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Front End Lead',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    const CircleAvatar(
                      backgroundImage:
                          NetworkImage('https://example.com/team-member-2.jpg'),
                      radius: 40.0,
                    ),
                    const SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        Text(
                          'Naman Khandelwal',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Front End Lead',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    const CircleAvatar(
                      backgroundImage:
                          NetworkImage('https://example.com/team-member-2.jpg'),
                      radius: 40.0,
                    ),
                    const SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        Text(
                          'Soum Nag',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Front End Lead',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigation(
          screen_index: 3,
        ));
  }
}
