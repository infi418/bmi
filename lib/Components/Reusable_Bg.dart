import 'package:flutter/material.dart';

class ReusableBg extends StatelessWidget {
  ReusableBg({required this.colour, required this.cardChild});
  final Color colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              color: Colors.black12.withOpacity(0.1),
              offset: Offset(-5, 0),
              spreadRadius: 2,
              blurRadius: 10.0),
          BoxShadow(
              color: Colors.black12.withOpacity(0.1),
              offset: Offset(0, 5),
              spreadRadius: 2,
              blurRadius: 10)
        ],
      ),
    );
  }
}
