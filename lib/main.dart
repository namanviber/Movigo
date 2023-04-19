import 'package:flutter/material.dart';
import 'package:project2/screens/authorization/login_screen.dart';
import 'package:project2/screens/authorization/sign_up_screen.dart';
import 'package:project2/utilities/Check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project2/screens/authorization/landing_screen.dart';
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
import 'package:project2/screens/findMovie/movieSelection.dart';
import 'package:project2/utilities/themedata.dart';
import 'package:flutter_smartlook/flutter_smartlook.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDatabase.connect();
  await Firebase.initializeApp();
  runApp(Movigo());
}

class Movigo extends StatefulWidget {
  Movigo({Key? key}) : super(key: key);

  @override
  State<Movigo> createState() => _MovigoState();
}

class _MovigoState extends State<Movigo> {
  final Smartlook smartlook = Smartlook.instance;

  void initState() {
    super.initState();
    smartlook.start();
    smartlook.preferences.setProjectKey('9cee2a7af978b8a4e5cf4ced9e48befbf1a5823f');
  }

  @override
  Widget build(BuildContext context) {
    return SmartlookRecordingWidget(
      child: MaterialApp(
        title: "Moviego",
        theme: ThemeClass.lightTheme,
        darkTheme: ThemeClass.darkTheme,
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
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
          '/splash_screen': (context) => LandingScreen(),
          '/check': (context) => Check(),
          '/profile_edit': (context) => ProfileEditPage(),
          '/search_screen': (_) => SearchScreen(),
          '/recommended_movies': (context) => RecommendedMovies(),
          '/Home': (_) => Home(),
        },
      ),
    );
  }
}
