import 'package:flutter/material.dart';
import 'package:coffee_journey/view/homePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coffee Journey',
      home: Home()
    );
  }
}
