import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:project2/authorization/Check.dart';
import 'package:project2/authorization/authPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project2/screens/findMovie/findMovie.dart';
import 'package:project2/service/mongoDbCall.dart';
import 'package:project2/screens/settings/about_us_screen.dart';
import 'package:project2/screens/settings/general_settings_screen.dart';
import 'package:project2/screens/home/home_screen.dart';
import 'package:project2/screens/settings/privacy_policy_screen.dart';
import 'package:project2/screens/settings/profile_edit_screen.dart';
import 'package:project2/screens/home/search_screen.dart';
import 'package:project2/screens/settings/settings_screen.dart';
import 'package:project2/screens/home/watchlist_screen.dart';
import 'package:project2/service/apiCall.dart';
import 'package:project2/screens/findMovie/movieSelection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDatabase.connect();
  await Firebase.initializeApp();
  runApp(Movigo());
}

class Movigo extends StatelessWidget {
  Movigo({Key? key}) : super(key: key);
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: "Moviego",
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: const Color(0xFF09090F),
          brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      home: Check(),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        // '/': (context) => const Home(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/general_setting': (context) => GeneralSettingsScreen(),
        '/about_us': (context) => AboutUsScreen(),
        '/privacy_policy': (context) => PrivacyPolicyScreen(),
        '/watch_list': (context) => WatchlistScreen(),
        '/home_screen': (context) => HomeScreen(),
        '/recommender_screen': (context) => RecommenderScreen(),
        '/setting_screen': (context) => SettingsScreen(),
        '/check': (context) => Check(),
        '/profile_edit': (context) => ProfileEditPage(),
        '/search_screen': (_) => SearchScreen(),
        '/recommended_movies': (context) => RecommendedMovies(),
        '/Home': (_) => Home(),
      },
    );
  }
}
