import 'package:flutter/material.dart';
import 'package:project2/screens/home_screen.dart';

void main() => runApp(MoviHub());

class MoviHub extends StatelessWidget {
  const MoviHub({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MovieHub",
      theme: ThemeData(
        primarySwatch: Colors.blue,
          scaffoldBackgroundColor: const Color(0xFF09090F),
        brightness: Brightness.dark
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      // Scaffold(
      //   appBar: AppBar(
      //     title: Text("MoviHub"),
      //   ),
      //   body: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       ElevatedButton(onPressed: () {}, child: Text("Hi 1"),),
      //       ElevatedButton(onPressed: () {}, child: Text("Hi 2")),
      //     ],
      //   ),
      // ),
    );
  }
}
