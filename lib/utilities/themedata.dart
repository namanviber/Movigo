import 'package:flutter/material.dart';

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
    cardColor: Color(0xffc5eae7),
    scaffoldBackgroundColor: Color(0xfffe6e6fa),
    highlightColor: Colors.deepPurple,
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
      backgroundColor: Color(0xfff663399),
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
    scaffoldBackgroundColor: Color(0xFF1c1c16),
    primaryColor: Colors.white,
    highlightColor: Colors.blue,
    cardColor: Color(0xff1c1c1c),
    canvasColor: Colors.white,
    primarySwatch: Colors.grey,
    indicatorColor: Colors.white,
    filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
      foregroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
    )),
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
    tabBarTheme: TabBarTheme(labelColor: Color(0xff8b48ff)),
    appBarTheme: AppBarTheme(
      surfaceTintColor: Color(0xff616161),
      shadowColor: Color(0xff616161),
      foregroundColor: Color(0xfff5f5f5),
      elevation: 0,
      toolbarHeight: 60,
      titleTextStyle: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Color(0xfff5f5f5),
      ),
      backgroundColor: Color(0xFF1c1c16),
    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: Color(0xFF1c1c16),
    ),
  );
}
