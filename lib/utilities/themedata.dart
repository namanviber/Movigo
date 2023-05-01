import 'package:flutter/material.dart';

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
    cardColor: Color(0xffFFF6E3),
    scaffoldBackgroundColor: Color(0xffeeeff1),
    highlightColor: Color(0xffaead8a),
    bottomAppBarTheme: BottomAppBarTheme(color: Color(0xff29048d)),
    canvasColor: Colors.black,
    primarySwatch: Colors.deepPurple,
    indicatorColor: Colors.white,
    filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
          foregroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
        )),
    textTheme: TextTheme(
      titleMedium: TextStyle(color: Color(0xff1f1f1f)),
      titleLarge: TextStyle(color: Color(0xff1f1f1f)),
      titleSmall: TextStyle(color: Color(0xff1f1f1f)),
      bodySmall: TextStyle(color: Colors.white),
    ),
    iconTheme: IconThemeData(
      color: Color(0xff29048d),
    ),
    tabBarTheme: TabBarTheme(labelColor: Color(0xff1f1f1f)),
    appBarTheme: AppBarTheme(
      surfaceTintColor: Color(0xff29048d),
      shadowColor: Color(0xff29048d),
      foregroundColor: Color(0xff29048d),
      elevation: 0,
      toolbarHeight: 60,
      titleTextStyle: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Color(0xff1f1f1f),
      ),
      backgroundColor: Color(0xfff5f0f0),
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
    cardColor: Color(0xFF2D2D05),
    scaffoldBackgroundColor: Color(0xFF1c1c16),
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
        titleMedium: TextStyle(color: Color(0xFFe5e2d9)),
        titleLarge: TextStyle(color: Color(0xFFe5e2d9)),
        titleSmall: TextStyle(color: Color(0xFFe5e2d9)),
        bodySmall: TextStyle(color: Colors.white),
        bodyLarge: TextStyle(color: Colors.blue)),
    iconTheme: IconThemeData(color: Color(0xff8b48ff)),
    iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
            foregroundColor: Colors.blueAccent, backgroundColor: Colors.white)),
    bottomNavigationBarTheme:
    BottomNavigationBarThemeData(backgroundColor: Color(0xff8b48ff)),
    inputDecorationTheme: InputDecorationTheme(),
    bottomAppBarTheme: BottomAppBarTheme(color: Color(0xff8b48ff)),
    indicatorColor: Colors.white,
    tabBarTheme: TabBarTheme(labelColor: Color(0xff8b48ff)),
    appBarTheme: AppBarTheme(
      foregroundColor: Color(0xff1f1f1f),
      elevation: 0,
      toolbarHeight: 60,
      titleTextStyle: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Color(0xffe5e2d9),
      ),
      backgroundColor: Color(0xff1f1f1f),
    ),
  );
}