import 'package:flutter/material.dart';

class ThemeClass {
  // static ThemeData lightTheme = ThemeData(
  //   cardColor: Colors.white,
  //   scaffoldBackgroundColor: Colors.grey[200],
  //   highlightColor: Colors.grey[300],
  //   bottomAppBarTheme: BottomAppBarTheme(color: Colors.green),
  //   canvasColor: Colors.white,
  //   primarySwatch: Colors.green,
  //   indicatorColor: Colors.green,
  //   filledButtonTheme: FilledButtonThemeData(
  //       style: ButtonStyle(
  //     backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
  //     foregroundColor: MaterialStatePropertyAll<Color>(Colors.white),
  //   )),
  //   textTheme: TextTheme(
  //     titleMedium: TextStyle(color: Colors.black),
  //     titleLarge: TextStyle(color: Colors.black),
  //     titleSmall: TextStyle(color: Colors.black),
  //     bodySmall: TextStyle(color: Colors.black),
  //   ),
  //   iconTheme: IconThemeData(
  //     color: Colors.green,
  //   ),
  //   tabBarTheme: TabBarTheme(labelColor: Colors.black),
  //   appBarTheme: AppBarTheme(
  //     backgroundColor: Colors.white,
  //     elevation: 0,
  //     toolbarHeight: 80,
  //     titleTextStyle: TextStyle(
  //       fontSize: 24,
  //       fontWeight: FontWeight.bold,
  //       color: Colors.black,
  //     ),
  //   ),
  //   iconButtonTheme: IconButtonThemeData(
  //       style: IconButton.styleFrom(foregroundColor: Colors.white)),
  //   drawerTheme: DrawerThemeData(
  //     backgroundColor: Colors.white,
  //   ),
  //   bottomNavigationBarTheme: BottomNavigationBarThemeData(
  //     backgroundColor: Colors.white,
  //   ),
  // );

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
    cardColor: Color(0xff1c1c1c),
    scaffoldBackgroundColor: Color(0xff1c1c1c),
    highlightColor: Color(0xff696969),
    bottomAppBarTheme: BottomAppBarTheme(color: Color(0xff616161)),
    canvasColor: Colors.white,
    primarySwatch: Colors.grey,
    indicatorColor: Colors.white,
    filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
      foregroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
    )),
    textTheme: TextTheme(
      titleMedium: TextStyle(color: Color(0xfff5f5f5)),
      titleLarge: TextStyle(color: Color(0xfff5f5f5)),
      titleSmall: TextStyle(color: Colors.white),
      bodySmall: TextStyle(color: Colors.white),
    ),
    iconTheme: IconThemeData(
      color: Color(0xfff5f5f5),
    ),
    tabBarTheme: TabBarTheme(labelColor: Color(0xfff5f5f5)),
    appBarTheme: AppBarTheme(
      surfaceTintColor: Color(0xff616161),
      shadowColor: Color(0xff616161),
      foregroundColor: Color(0xfff5f5f5),
      elevation: 0,
      toolbarHeight: 80,
      titleTextStyle: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Color(0xfff5f5f5),
      ),
      backgroundColor: Color(0xff1c1c1c),
    ),
    iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(foregroundColor: Colors.white)),
    drawerTheme: DrawerThemeData(
      backgroundColor: Color(0xff1c1c1c),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xff1c1c1c),
    ),
  );

  // static ThemeData darkTheme = ThemeData(
  //   cardColor: Color(0xFF043E4F),
  //   scaffoldBackgroundColor: Color(0xFF1c1c16),
  //   primaryColor: Colors.white,
  //   highlightColor: Colors.blue,
  //   canvasColor: Colors.white,
  //   filledButtonTheme: FilledButtonThemeData(
  //       style: ButtonStyle(
  //     backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
  //     foregroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
  //   )),
  //   primarySwatch: Colors.deepPurple,
  //   textTheme: TextTheme(
  //       titleMedium: TextStyle(color: Color(0xFFe5e2d9)),
  //       titleLarge: TextStyle(color: Color(0xFFe5e2d9)),
  //       titleSmall: TextStyle(color: Color(0xFFe5e2d9)),
  //       bodySmall: TextStyle(color: Colors.black),
  //       bodyLarge: TextStyle(color: Colors.blue)),
  //   iconTheme: IconThemeData(color: Colors.white),
  //   iconButtonTheme: IconButtonThemeData(
  //       style: IconButton.styleFrom(
  //           foregroundColor: Colors.blueAccent, backgroundColor: Colors.white)),
  //   bottomNavigationBarTheme:
  //       BottomNavigationBarThemeData(backgroundColor: Color(0xff494a00)),
  //   inputDecorationTheme: InputDecorationTheme(),
  //   bottomAppBarTheme: BottomAppBarTheme(color: Color(0xff616200)),
  //   indicatorColor: Colors.white,
  //   tabBarTheme: TabBarTheme(labelColor: Color(0xff1f1f1f)),
  //   appBarTheme: AppBarTheme(
  //     foregroundColor: Color(0xff616200),
  //     elevation: 0,
  //     toolbarHeight: 80,
  //     titleTextStyle: TextStyle(
  //       fontSize: 24,
  //       fontWeight: FontWeight.bold,
  //       color: Color(0xffe5e2d9),
  //     ),
  //     backgroundColor: Color(0xff48482d),
  //   ),
  // );
}
