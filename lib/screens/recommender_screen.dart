import 'package:flutter/material.dart';
import 'package:project2/widgets/bottom_bar.dart';

class RecommenderScreen extends StatefulWidget {
  const RecommenderScreen({Key? key}) : super(key: key);
  @override
  State<RecommenderScreen> createState() => _RecommenderScreenState();
}

class _RecommenderScreenState extends State<RecommenderScreen> {
  int screen_index = 1;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Text("recommender screen"),
        ),
        bottomNavigationBar: BottomNavigation(screen_index: 1,),
      ),
    );
  }
}
