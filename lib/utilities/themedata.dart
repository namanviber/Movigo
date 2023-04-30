import 'package:flutter/material.dart';

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
    cardColor: Color(0xffc5eae7),
    scaffoldBackgroundColor: Color(0xfffefcf6),
    highlightColor: Color(0xffaead8a),
    bottomAppBarTheme: BottomAppBarTheme(color: Color(0xff616200)),
    canvasColor: Colors.black,
    primarySwatch: Colors.green,
    indicatorColor: Colors.white,
    filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
      foregroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
    )),
    textTheme: TextTheme(
      titleMedium: TextStyle(color: Color(0xff4f4330)),
      titleLarge: TextStyle(color: Color(0xff1b1c18)),
      titleSmall: TextStyle(color: Colors.black),
      bodySmall: TextStyle(color: Colors.white),
    ),
    iconTheme: IconThemeData(
      color: Color(0xff496727),
    ),
    tabBarTheme: TabBarTheme(labelColor: Color(0xff1f1f1f)),
    appBarTheme: AppBarTheme(
      surfaceTintColor: Color(0xff616200),
      shadowColor: Color(0xff616200),
      foregroundColor: Color(0xff616200),
      elevation: 0,
      toolbarHeight: 80,
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
    cardColor: Color(0xFF043E4F),
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
        bodySmall: TextStyle(color: Colors.black),
        bodyLarge: TextStyle(color: Colors.blue)),
    iconTheme: IconThemeData(color: Colors.white),
    iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
            foregroundColor: Colors.blueAccent, backgroundColor: Colors.white)),
    bottomNavigationBarTheme:
        BottomNavigationBarThemeData(backgroundColor: Color(0xff494a00)),
    inputDecorationTheme: InputDecorationTheme(),
    bottomAppBarTheme: BottomAppBarTheme(color: Color(0xff616200)),
    indicatorColor: Colors.white,
    tabBarTheme: TabBarTheme(labelColor: Color(0xff1f1f1f)),
    appBarTheme: AppBarTheme(
      foregroundColor: Color(0xff616200),
      elevation: 0,
      toolbarHeight: 80,
      titleTextStyle: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Color(0xffe5e2d9),
      ),
      backgroundColor: Color(0xff48482d),
    ),
  );
}
