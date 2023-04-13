import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:project2/authorization/Check.dart';
import 'package:project2/authorization/authPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project2/screens/landing_screen.dart';

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
        // '/': (context) => const Home(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/general_setting': (context) => const GeneralSettingsScreen(),
        '/about_us':(context)=> AboutUsScreen(),
        '/privacy_policy':(context)=>const PrivacyPolicyScreen(),
        '/watch_list':(context)=>const WatchlistScreen(),
        '/home_screen':(context)=>const HomeScreen(),
        '/recommender_screen':(context)=> const RecommenderScreen(),
        '/setting_screen':(context)=>const SettingsScreen(),
        '/splash_screen':(context)=>LandingScreen(),
        '/signup_screen':(context)=>SignUp(),
        '/login_screen':(context)=>LoginScreen(),
        '/check':(context)=>const Check(),
        '/profile_edit':(context)=>ProfileEditPage(),
        '/search_screen':(_)=>SearchScreen(),
        '/recommended_movies':(context)=>RecommendedMovies(),
        '/Home':(_)=>Home(),

      },
    );
  }


}
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final items = const [
    Icon(Icons.people, size: 30,),
    Icon(Icons.search, size: 30,),
    Icon(Icons.watch_later, size: 30,),
    Icon(Icons.settings, size: 30,)
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.blueAccent,
      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor: Color(0xff78787e),
color: Color(0xff303034),
        items: items,
        index: index,
        onTap: (selctedIndex){
          setState(() {
            index = selctedIndex;
          });
        },
        height: 53,
        backgroundColor: Colors.transparent,
        animationDuration: const Duration(milliseconds: 300),
        // animationCurve: ,
      ),
      body: Container(
          color: Colors.blue,
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: getSelectedWidget(index: index)
      ),
    );
  }

  Widget getSelectedWidget({required int index}){
    Widget widget;
    switch(index){
      case 0:
        widget = const HomeScreen();
        break;
      case 1:
        widget = SearchScreen();
        break;
      case 2:
        widget = WatchlistScreen();
        break;
      case 3:
        widget = SettingsScreen();
        break;
      default:
        widget = const HomeScreen();
        break;
    }
    return widget;
  }
}

