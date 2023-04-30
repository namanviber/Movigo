import 'package:flutter/material.dart';
import 'package:project2/widgets/bottom_bar.dart';

class AboutUsScreen extends StatelessWidget {
  int screen_index = 5;

  AboutUsScreen({super.key});

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
                Text(
                  'Our Story',
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.titleSmall!.color),
                ),
                const SizedBox(height: 10.0),
                Text(
                  "This application is our course project for the PROJECT 2 course",
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Theme.of(context).textTheme.titleSmall!.color),
                ),
                const SizedBox(height: 20.0),
                Text(
                  'Our Team',
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.titleSmall!.color),
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    const CircleAvatar(
                      radius: 40.0,
                      child: Text("N"),
                    ),
                    const SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Naman Jain',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .color),
                        ),
                        Text(
                          'Team Lead',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .color),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    const CircleAvatar(
                      radius: 40.0,
                      child: Text("A"),
                    ),
                    const SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Aryaman Sital',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .color),
                        ),
                        Text(
                          'Front End Lead',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .color),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    const CircleAvatar(
                      radius: 40.0,
                      child: Text("D"),
                    ),
                    const SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Dhaval Pathak',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .color),
                        ),
                        Text(
                          'Front End Lead',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .color),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    const CircleAvatar(
                      radius: 40.0,
                      child: Text("S"),
                    ),
                    const SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Sidharth Aggarwal',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .color),
                        ),
                        Text(
                          'Front End Lead',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .color),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    const CircleAvatar(
                      radius: 40.0,
                      child: Text("P"),
                    ),
                    const SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Priyansh Tyagi',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .color),
                        ),
                        Text(
                          'Front End Lead',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .color),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    const CircleAvatar(
                      radius: 40.0,
                      child: Text("N"),
                    ),
                    const SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Naman Khandelwal',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .color),
                        ),
                        Text(
                          'Front End Lead',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .color),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    const CircleAvatar(
                      radius: 40.0,
                      child: Text("S"),
                    ),
                    const SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Soum Nag',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .color),
                        ),
                        Text(
                          'Front End Lead',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .color),
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
