import 'package:flutter/material.dart';
class ThemeClass{

  static ThemeData lightTheme = ThemeData(

    scaffoldBackgroundColor: Colors.white,

    canvasColor: Colors.black,


    primarySwatch: Colors.pink,

    textTheme: TextTheme(
      titleMedium: TextStyle(color: Color(0xff969696)),
      titleLarge: TextStyle(color: Colors.black),
      titleSmall: TextStyle(color: Color(0xffDE6077)),
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,),

    iconButtonTheme: IconButtonThemeData(style: IconButton.styleFrom(foregroundColor: Colors.black)),

    drawerTheme: DrawerThemeData(backgroundColor: Colors.white,),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: Colors.white,),
  );

  static ThemeData darkTheme = ThemeData(

    scaffoldBackgroundColor: Color(0xFF000000),

    canvasColor: Colors.white,

    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
        foregroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
      )
    ),

    primarySwatch: Colors.deepPurple,

    textTheme: TextTheme(
      titleMedium: TextStyle(color: Color(0xFFF0F2FF)),
      titleLarge: TextStyle(color: Colors.white),
      titleSmall: TextStyle(color: Color(0xFFF0F2FF)),
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF16171C),
    ),

    iconButtonTheme: IconButtonThemeData(style: IconButton.styleFrom(foregroundColor: Colors.blueAccent)),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: Colors.blueAccent),
  );
}
