import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:project2/authorization/Check.dart';
import 'package:project2/authorization/authPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project2/screens/authorization/landing_screen.dart';

import 'package:project2/screens/findMovie/findMovie.dart';
import 'package:project2/screens/authorization/sign_up_screen.dart';
import 'package:project2/screens/home/splash_screen.dart';
import 'package:project2/service/mongoDbCall.dart';
import 'package:project2/screens/settings/about_us_screen.dart';
import 'package:project2/screens/settings/general_settings_screen.dart';
import 'package:project2/screens/home/home_screen.dart';
import 'package:project2/screens/authorization/login_screen.dart';
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
        '/splash_screen': (context) => LandingScreen(),
        '/signup_screen': (context) => SignUp(),
        '/login_screen': (context) => LoginScreen(),
        '/check': (context) => Check(),
        '/profile_edit': (context) => ProfileEditPage(),
        '/search_screen': (_) => SearchScreen(),
        '/recommended_movies': (context) => RecommendedMovies(),
        '/Home': (_) => Home(),
      },
    );
  }
}
//
// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);
//
//   @override
//   _HomeState createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   final items = const [
//     Icon(
//       Icons.home_filled,
//       size: 30,
//     ),
//     Icon(
//       Icons.search,
//       size: 30,
//     ),
//     Icon(
//       Icons.bookmark,
//       size: 30,
//     ),
//     Icon(
//       Icons.settings,
//       size: 30,
//     )
//   ];
//
//   int index = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blueAccent,
//       bottomNavigationBar: CurvedNavigationBar(
//         buttonBackgroundColor: Color(0xFF09090F),
//         color: Color(0xFF09090F),
//         items: items,
//         index: index,
//         onTap: (selctedIndex) {
//           setState(() {
//             index = selctedIndex;
//           });
//         },
//         height: 55,
//         backgroundColor: Colors.transparent,
//         animationDuration: const Duration(milliseconds: 300),
//         // animationCurve: ,
//       ),
//       body: Container(
//           color: Colors.blue,
//           width: double.infinity,
//           height: double.infinity,
//           alignment: Alignment.center,
//           child: getSelectedWidget(index: index)),
//     );
//   }
//
//   Widget getSelectedWidget({required int index}) {
//     Widget widget;
//     switch (index) {
//       case 0:
//         widget = const HomeScreen();
//         break;
//       case 1:
//         widget = SearchScreen();
//         break;
//       case 2:
//         widget = WatchlistScreen();
//         break;
//       case 3:
//         widget = SettingsScreen();
//         break;
//       default:
//         widget = const HomeScreen();
//         break;
//     }
//     return widget;
//   }
// }
