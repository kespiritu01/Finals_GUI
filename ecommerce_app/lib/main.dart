import 'package:flutter/material.dart';
import 'screens/splash_screen.dart'; 

void main() {
  runApp(RetroRealmApp());
}

class RetroRealmApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Retro Realm',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blueGrey,
        fontFamily: 'Georgia',
      ),
      home: SplashScreen(),
    );
  }
}