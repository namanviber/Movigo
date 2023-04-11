import 'package:flutter/material.dart';
import 'package:project2/authorization/Check.dart';
import 'package:project2/authorization/authPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project2/screens/landing_screen.dart';
import 'package:project2/screens/new.dart';
import 'package:project2/screens/recommender_screen.dart';
import 'package:project2/screens/sign_up_screen.dart';
import 'package:project2/screens/splash_screen.dart';
import 'package:project2/service/mongoDbCall.dart';
import 'package:project2/screens/about_us_screen.dart';
import 'package:project2/screens/general_settings_screen.dart';
import 'package:project2/screens/home_screen.dart';
import 'package:project2/screens/login_screen.dart';
import 'package:project2/screens/privacy_policy_screen.dart';
import 'package:project2/screens/profile_edit_screen.dart';
import 'package:project2/screens/search_screen.dart';
import 'package:project2/screens/settings_screen.dart';
import 'package:project2/screens/watchlist_screen.dart';
import 'package:project2/service/apiCall.dart';
import 'package:project2/screens/recommended_movies.dart';

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
      home: SplashScreen(),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        // '/': (context) => const Check(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/general_setting': (context) => const GeneralSettingsScreen(),
        '/about_us':(context)=> AboutUsScreen(),
        '/privacy_policy':(context)=>const PrivacyPolicyScreen(),
        '/watch_list':(context)=>const New(),
        '/home_screen':(context)=>const HomeScreen(),
        '/recommender_screen':(context)=> const RecommenderScreen(),
        '/setting_screen':(context)=>const SettingsScreen(),
        '/splash_screen':(context)=>LandingScreen(),
        '/signup_screen':(context)=>SignUp(),
        '/login_screen':(context)=>LoginScreen(),
        '/check':(context)=>const Check(),
        '/profile_edit':(context)=>ProfileEditPage(),
        '/search_screen':(_)=>SearchScreen(),
        '/recommended_movies':(context)=>RecommendedMovies()

      },
    );
  }
}
