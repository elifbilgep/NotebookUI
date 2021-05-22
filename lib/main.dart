import 'package:flutter/material.dart';
import 'View/pages/home.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projem',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: HomePage(),
    );
  }
}
