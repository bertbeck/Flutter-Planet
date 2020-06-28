import 'package:flutter/material.dart';
import 'package:flutter_planet/Page3.dart';
import 'package:flutter_planet/Page4.dart';

import 'Page5.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shivani',
      routes: {
    '/p1': (context) => Page3(),
    '/p2': (context) => Page4(),
    '/p3': (context) => Page5(),
  },
  home: Page3(),
      
    );
  }
}