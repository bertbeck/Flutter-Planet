import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_planet/home_page.dart';

import 'Page3.dart';
import 'Page4.dart';
import 'Page5.dart';
import 'first_screen.dart';
import 'login_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Planet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
  initialRoute: '/',
  routes: {
    // When navigating to the "/" route, build the FirstScreen widget.
    '/': (context) => HomePage(),
    '/first': (context) => FirstScreen(),
    '/login': (context) => LoginPage(),
    '/page3': (context) => Page3(),
    '/page4': (context) => Page4(),
    '/page5': (context) => Page5(),
  
  },      
      //home: HomePage(),
    );
  }
}
