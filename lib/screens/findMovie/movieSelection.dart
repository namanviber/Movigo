import 'package:flutter/material.dart';

class RecommendedMovies extends StatelessWidget {
  const RecommendedMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}
bool value = false;
bool value1 = false;
bool value2 = false;
bool value3 = false;

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/img.png'), fit: BoxFit.cover),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30,),
            Image.asset('assets/images/09090F.png',fit: BoxFit.cover,),
            Container(padding: const EdgeInsets.fromLTRB(20,0,20,0),
              child: const Text("Here are some good suggestions for you",textAlign: TextAlign.left,style: TextStyle(fontSize: 25,decoration: TextDecoration.none,color: Colors.white),),),
            const SizedBox(height: 5,),
            Row(
              children: [
                const SizedBox(width: 10,),
                ElevatedButton(
                  onPressed:(){setState(() {value=!value;});},
                  style: ElevatedButton.styleFrom(padding: const EdgeInsets.fromLTRB(0,0,0,0), backgroundColor: value?Colors.transparent:Colors.transparent, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),side: const BorderSide(width: 2.0,color: Colors.white),),
                  child: Image.asset('assets/images/img_4.png',height: 250,width: 150,fit: BoxFit.cover,),),
                const SizedBox(width: 40,),
                ElevatedButton(onPressed:(){setState(() {value1=!value1;});},
                  style: ElevatedButton.styleFrom(backgroundColor: value1?Colors.transparent:Colors.transparent, padding: const EdgeInsets.fromLTRB(0,0,0,0),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),side: const BorderSide(width: 2.0,color: Colors.white),),
                  child: Image.asset('assets/images/img_2.png',height: 250,width: 150,fit: BoxFit.cover,),),
              ],),
            const SizedBox(height: 10,),
            Row(
              children: [
                const SizedBox(width: 10,),
                ElevatedButton(
                  onPressed:(){setState(() {value2=!value2;});},
                  style: ElevatedButton.styleFrom(padding: const EdgeInsets.fromLTRB(0,0,0,0), backgroundColor: value2?Colors.transparent:Colors.transparent, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),side: const BorderSide(width: 2.0,color: Colors.white)),
                  child: Image.asset('assets/images/img_5.png',height: 250,width: 150,fit: BoxFit.cover,),
                ),
                const SizedBox(width: 40,),
                ElevatedButton(
                  onPressed:(){setState(() {value3=!value3;});},
                  style: ElevatedButton.styleFrom(padding: const EdgeInsets.fromLTRB(0,10,0,0), backgroundColor: value3?Colors.transparent:Colors.transparent,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),side: const BorderSide(width: 2.0,color: Colors.white)),
                  child: Image.asset('assets/images/img_4.png',height: 250,width: 150,fit: BoxFit.cover,),
                ),
              ],),
            const SizedBox(height: 10,),
            Row(
              children: [
                const SizedBox(width: 100,height: 15,),
                OutlinedButton(onPressed:(){} ,style: OutlinedButton.styleFrom(backgroundColor: Colors.blue,padding: const EdgeInsets.fromLTRB(50,20,50,20), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),child: const Text("Refresh",style: TextStyle(color: Colors.white),),),
              ],),
            const SizedBox(height: 10,),
          ],),
      ),);
  }
}




