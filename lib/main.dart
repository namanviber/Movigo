import 'package:flutter/material.dart';
import 'package:project2/screens/authorization/login_screen.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:project2/screens/settings/profilePage.dart';
import 'package:project2/utilities/Check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project2/screens/authorization/landing_screen.dart';
import 'package:project2/screens/findMovie/findMovie.dart';
import 'package:project2/service/mongoDbCall.dart';
import 'package:project2/screens/settings/about_us_screen.dart';
import 'package:project2/screens/settings/general_settings_screen.dart';
import 'package:project2/screens/home/home_screen.dart';
import 'package:project2/screens/settings/privacy_policy_screen.dart';
import 'package:project2/screens/home/search_screen.dart';
import 'package:project2/screens/settings/settings_screen.dart';
import 'package:project2/screens/home/watchlist_screen.dart';
import 'package:project2/screens/findMovie/movieSelection.dart';
import 'package:project2/utilities/themedata.dart';
import 'package:project2/widgets/filter_result.dart';
import 'package:project2/widgets/grid_of_genre.dart';

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



  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(builder: (lightColorScheme, darkColorScheme) {
      return MaterialApp(
        title: "Moviego",
        theme: ThemeClass.lightTheme,
        darkTheme: ThemeClass.darkTheme,
        themeMode: ThemeMode.light,
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
          '/splash_screen': (context) => LandingScreen(),
          '/check': (context) => Check(),
          '/profile_edit': (context) => Profilepage(),
          '/search_screen': (_) => SearchScreen(),
          '/recommended_movies': (context) => RecommendedMovies(),
          '/Home': (_) => Home(),
          '/Profilepage': (_) => Profilepage(),
          '/GridOfGenre': (_) => GridOfGenre(),
          '/filter_results': (context) => FilterResults(
              argument: ModalRoute.of(context)!.settings.arguments as String)
        },
      );
    });
  }
}
