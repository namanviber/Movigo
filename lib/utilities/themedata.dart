import 'package:flutter/material.dart';

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
    cardColor: Colors.blueAccent,
    scaffoldBackgroundColor: Colors.white,
    highlightColor: Colors.grey,
    canvasColor: Colors.black,
    primarySwatch: Colors.pink,
    filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
      foregroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
    )),
    textTheme: TextTheme(
      titleMedium: TextStyle(color: Colors.black),
      titleLarge: TextStyle(color: Colors.black),
      titleSmall: TextStyle(color: Colors.black),
    ),
    iconTheme: IconThemeData(color: Colors.black),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
    ),
    iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(foregroundColor: Colors.black)),
    drawerTheme: DrawerThemeData(
      backgroundColor: Colors.white,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
    ),
  );

  static ThemeData darkTheme = ThemeData(
      cardColor: Color(0xFF043E4F),
      scaffoldBackgroundColor: Color(0xFF000000),
      primaryColor: Colors.white,
      highlightColor: Colors.blue,
      canvasColor: Colors.white,
      filledButtonTheme: FilledButtonThemeData(
          style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
        foregroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
      )),
      primarySwatch: Colors.deepPurple,
      textTheme: TextTheme(
          titleMedium: TextStyle(color: Color(0xFFF0F2FF)),
          titleLarge: TextStyle(color: Colors.amber.shade50),
          titleSmall: TextStyle(color: Color(0xFFF0F2FF)),
          bodySmall: TextStyle(color: Colors.black),
          bodyLarge: TextStyle(color: Colors.blue)),
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xFF16171C),
      ),
      iconTheme: IconThemeData(color: Colors.white),
      iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
              foregroundColor: Colors.blueAccent,
              backgroundColor: Colors.white)),
      bottomNavigationBarTheme:
          BottomNavigationBarThemeData(backgroundColor: Colors.blueAccent),
      inputDecorationTheme: InputDecorationTheme());
}
