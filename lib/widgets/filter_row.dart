import 'package:flutter/material.dart';

class FilterRow extends StatelessWidget {
  FilterRow({required this.count, required this.elements, Key? key})
      : super(key: key);
  int? count;
  List? elements;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.maxFinite,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: count,
          itemBuilder: (BuildContext context, index) {
            return Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      side: const BorderSide(width: 2.0, color: Colors.white)),
                  child: Text(elements![index],
                      style: const TextStyle(color: Colors.white)),
                ),
              ),
            );
          }),
    );
  }
}
