import 'package:flutter/material.dart';
import 'package:coffee_journey/view/homePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor:  Colors.brown,
        accentColor:  Colors.brown
      ),
      debugShowCheckedModeBanner: false,
      title: 'Coffee Journey',
      home: Home()
    );
  }
}
