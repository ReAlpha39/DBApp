import 'package:flutter/material.dart';

class Timeline extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 20, left: 20),
          child: Container(
            height: 20,
            width: 25,
            decoration: BoxDecoration(
              color: Colors.brown[800],
              borderRadius: BorderRadius.circular(3)
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 7,
                bottom: 7,
                left: 13
              ),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 28, left: 12),
          child: Container(
            width: 8,
            height: 2,
            color: Colors.brown[800],
          ),
        ),
      ],
    );
  }
}