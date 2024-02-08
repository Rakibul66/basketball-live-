
import 'package:basketlive/screens/live_match_list.dart';
import 'package:basketlive/screens/splash_screen.dart';
import 'package:flutter/material.dart';


void main() => runApp( MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Live Matches'),
        ),
        body: SplashScreen(),
      ),
    );
  }
}

