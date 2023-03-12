import 'package:flutter/material.dart';

class FilterRow extends StatelessWidget {
  FilterRow({required this.count, required this.elements ,Key? key}) : super(key: key);
  int? count;
  List? elements;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.maxFinite,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: count,
          itemBuilder: (BuildContext context, index){
            return Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color(0xFF51535E),
                  ),
                  width: 100,
                  alignment: Alignment.center,
                  child: Text(elements![index],
                      style: TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.bold,
                          fontSize: 13), textAlign: TextAlign.center,),
                ),
              ),
            );
          }
      ),
    );
  }
}
