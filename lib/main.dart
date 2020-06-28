import 'package:flutter/material.dart';

import 'Page3.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shivani',
      theme: ThemeData(
        primaryColor: Colors.black,

      ),
  home: Page3(),
      
    );
  }
}