import 'package:flutter/material.dart';

class RecommenderScreen extends StatefulWidget {
  const RecommenderScreen({Key? key}) : super(key: key);

  @override
  State<RecommenderScreen> createState() => _RecommenderScreenState();
}
bool value = false;
bool value1 = false;
bool value2 = false;
bool value3 = false;
bool value4 = false;
bool value5 = false;
bool value6 = false;
bool value7 = false;
bool value8 = false;
bool value9 = false;
bool value10 = false;
bool value11 = false;
bool value12 = false;
bool value13 = false;
bool value14 = false;
bool value15 = false;
bool value16 = false;
bool value17 = false;
class _RecommenderScreenState extends State<RecommenderScreen> {
  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/img.png'), fit: BoxFit.cover),
      ),
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 100,),
              Image.asset('assets/09090F.png',fit: BoxFit.cover,),
              Container(padding: EdgeInsets.fromLTRB(20,0,20,0),
                child: Text("Choose Your Favourite Genres",textAlign: TextAlign.left,style: TextStyle(fontSize: 25,decoration: TextDecoration.none,color: Colors.white),),),
              SizedBox(height: 15,),
              Row(
                children: [
                  SizedBox(width: 10,),
                  OutlinedButton(onPressed:(){setState(() {
                    value=!value;});} , child: Text("Action",style: TextStyle(color: Colors.white)),
                    style: OutlinedButton.styleFrom(
                        backgroundColor: value?Colors.blueAccent:Colors.transparent,
                        padding: EdgeInsets.fromLTRB(20,20,20,20),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),side: BorderSide(width: 2.0,color: Colors.white)),
                  ),
                  SizedBox(width: 25,),
                  OutlinedButton(onPressed:(){setState(() {
                    value1=!value1;});} , child: Text("Adventure",style: TextStyle(color: Colors.white)),
                    style: OutlinedButton.styleFrom(
                        backgroundColor: value1?Colors.blueAccent:Colors.transparent,
                        padding: EdgeInsets.fromLTRB(20,20,20,20),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),side: BorderSide(width: 2.0,color: Colors.white)),
                  ),
                  SizedBox(width: 25,),
                  OutlinedButton(onPressed:(){setState(() {
                    value2=!value2;});} , child: Text("Animation",style: TextStyle(color: Colors.white)),
                    style: OutlinedButton.styleFrom(
                        backgroundColor: value2?Colors.blueAccent:Colors.transparent,
                        padding: EdgeInsets.fromLTRB(20,20,20,20),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),side: BorderSide(width: 2.0,color: Colors.white)),
                  ),],),
              SizedBox(height: 20,),
              Row(
                children: [
                  SizedBox(width: 30,),
                  OutlinedButton(onPressed:(){setState(() {
                    value3=!value3;});} , child: Text("Comedy",style: TextStyle(color: Colors.white)),
                    style: OutlinedButton.styleFrom(
                        backgroundColor: value3?Colors.blueAccent:Colors.transparent,
                        padding: EdgeInsets.fromLTRB(20,20,20,20),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),side: BorderSide(width: 2.0,color: Colors.white)),
                  ),
                  SizedBox(width: 15,),
                  OutlinedButton(onPressed:(){setState(() {
                    value6=!value6;});} , child: Text("Children",style: TextStyle(color: Colors.white)),
                    style: OutlinedButton.styleFrom(
                        backgroundColor: value6?Colors.blueAccent:Colors.transparent,
                        padding: EdgeInsets.fromLTRB(20,20,20,20),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),side: BorderSide(width: 2.0,color: Colors.white)),
                  ),
                  SizedBox(width: 15,),
                  OutlinedButton(onPressed:(){setState(() {
                    value7=!value7;});} , child: Text("Fantasy",style: TextStyle(color: Colors.white)),
                    style: OutlinedButton.styleFrom(
                        backgroundColor: value7?Colors.blueAccent:Colors.transparent,
                        padding: EdgeInsets.fromLTRB(20,20,20,20),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),side: BorderSide(width: 2.0,color: Colors.white)),
                  ),],),
              SizedBox(height: 20,),
              Row(
                children: [
                  SizedBox(width: 10),
                  OutlinedButton(onPressed:(){setState(() {
                    value4=!value4;});} , child: Text("Crime",style: TextStyle(color: Colors.white)),
                    style: OutlinedButton.styleFrom(
                        backgroundColor: value4?Colors.blueAccent:Colors.transparent,
                        padding: EdgeInsets.fromLTRB(20,20,20,20),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),side: BorderSide(width: 2.0,color: Colors.white)),
                  ),
                  SizedBox(width: 25,),
                  OutlinedButton(onPressed:(){setState(() {
                    value5=!value5;});} , child: Text("Documentary",style: TextStyle(color: Colors.white)),
                    style: OutlinedButton.styleFrom(
                        backgroundColor: value5?Colors.blueAccent:Colors.transparent,
                        padding: EdgeInsets.fromLTRB(20,20,20,20),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),side: BorderSide(width: 2.0,color: Colors.white)),
                  ),
                  SizedBox(width: 25),
                  OutlinedButton(onPressed:(){setState(() {
                    value8=!value8;});} , child: Text("Drama",style: TextStyle(color: Colors.white)),
                    style: OutlinedButton.styleFrom(
                        backgroundColor: value8?Colors.blueAccent:Colors.transparent,
                        padding: EdgeInsets.fromLTRB(20,20,20,20),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),side: BorderSide(width: 2.0,color: Colors.white)),
                  ),],),
              SizedBox(height: 20,),
              Row(
                children: [
                  SizedBox(width: 30,),
                  OutlinedButton(onPressed:(){setState(() {
                    value9=!value9;});} , child: Text("History",style: TextStyle(color: Colors.white)),
                    style: OutlinedButton.styleFrom(
                        backgroundColor: value9?Colors.blueAccent:Colors.transparent,
                        padding: EdgeInsets.fromLTRB(25,20,25,20),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),side: BorderSide(width: 2.0,color: Colors.white)),
                  ),
                  SizedBox(width: 20,),
                  OutlinedButton(onPressed:(){setState(() {
                    value10=!value10;});} , child: Text("Horror",style: TextStyle(color: Colors.white)),
                    style: OutlinedButton.styleFrom(
                        backgroundColor: value10?Colors.blueAccent:Colors.transparent,
                        padding: EdgeInsets.fromLTRB(25,20,25,20),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),side: BorderSide(width: 2.0,color: Colors.white)),
                  ),
                  SizedBox(width: 20,),
                  OutlinedButton(onPressed:(){setState(() {
                    value11=!value11;});} , child: Text("Romance",style: TextStyle(color: Colors.white)),
                    style: OutlinedButton.styleFrom(
                        backgroundColor: value11?Colors.blueAccent:Colors.transparent,
                        padding: EdgeInsets.fromLTRB(20,20,20,20),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),side: BorderSide(width: 2.0,color: Colors.white)),
                  ),],),
              SizedBox(height: 20,),
              Row(
                children: [
                  SizedBox(width: 10),
                  OutlinedButton(onPressed:(){setState(() {
                    value12=!value12;});} , child: Text("Mystery",style: TextStyle(color: Colors.white)),
                    style: OutlinedButton.styleFrom(
                        backgroundColor: value12?Colors.blueAccent:Colors.transparent,
                        padding: EdgeInsets.fromLTRB(20,20,20,20),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),side: BorderSide(width: 2.0,color: Colors.white)),
                  ),
                  SizedBox(width: 25,),
                  OutlinedButton(onPressed:(){setState(() {
                    value13=!value13;});} , child: Text("Thriller",style: TextStyle(color: Colors.white)),
                    style: OutlinedButton.styleFrom(
                        backgroundColor: value13?Colors.blueAccent:Colors.transparent,
                        padding: EdgeInsets.fromLTRB(20,20,20,20),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),side: BorderSide(width: 2.0,color: Colors.white)),
                  ),
                  SizedBox(width: 25,),
                  OutlinedButton(onPressed:(){setState(() {
                    value14=!value14;});} , child: Text("Film-Noir",style: TextStyle(color: Colors.white)),
                    style: OutlinedButton.styleFrom(
                        backgroundColor: value14?Colors.blueAccent:Colors.transparent,
                        padding: EdgeInsets.fromLTRB(20,20,20,20),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),side: BorderSide(width: 2.0,color: Colors.white)),
                  ),],),
              SizedBox(height: 20,),
              Row(
                children: [
                  SizedBox(width: 30,),
                  OutlinedButton(onPressed:(){setState(() {
                    value15=!value15;});} , child: Text("War",style: TextStyle(color: Colors.white)),
                    style: OutlinedButton.styleFrom(
                        backgroundColor: value15?Colors.blueAccent:Colors.transparent,
                        padding: EdgeInsets.fromLTRB(30,20,30,20),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),side: BorderSide(width: 2.0,color: Colors.white)),
                  ),
                  SizedBox(width: 20),
                  OutlinedButton(onPressed:(){setState(() {
                    value16=!value16;});} , child: Text("Sci-Fi",style: TextStyle(color: Colors.white)),
                    style: OutlinedButton.styleFrom(
                        backgroundColor: value16?Colors.blueAccent:Colors.transparent,
                        padding: EdgeInsets.fromLTRB(30,20,30,20),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),side: BorderSide(width: 2.0,color: Colors.white)),
                  ),
                  SizedBox(width: 20,),
                  OutlinedButton(onPressed:(){setState(() {
                    value17=!value17;
                  });} , child: Text("Western",style: TextStyle(color: Colors.white)),
                    style: OutlinedButton.styleFrom(
                        backgroundColor: value17?Colors.blueAccent:Colors.transparent,
                        padding: EdgeInsets.fromLTRB(20,20,20,20),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),side: BorderSide(width: 2.0,color: Colors.white)),
                  ),],),
              SizedBox(height: 30,),
              Row(
                children: [
                  SizedBox(width: 100,height: 15,),
                  OutlinedButton(onPressed:(){Navigator.pushNamed(context, '/recommended_movies');} , child: Text("Continue",style: TextStyle(color: Colors.white),), style: OutlinedButton.styleFrom(backgroundColor: Colors.blue,padding: EdgeInsets.fromLTRB(50,20,50,20), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),),
                ],),
              SizedBox(height: 40,),],
          ),
        ),),);
  }
}




