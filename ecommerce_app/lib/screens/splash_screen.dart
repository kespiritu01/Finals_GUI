import 'dart:async';
import 'package:flutter/material.dart';
import 'home_screen.dart';
import '../models/product.dart'; 

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();

    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => HomeScreen(onAddToCart: (product) {

        })), 
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color.fromARGB(255, 74, 138, 140), const Color.fromARGB(255, 230, 228, 226)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: FadeTransition(
          opacity: _animation,
          child: Center(
            child: Text(
              'Retro Realm',
              style: TextStyle(
                fontSize: 56,
                fontWeight: FontWeight.w900,
                color: const Color.fromARGB(255, 231, 230, 230),
                shadows: [
                  Shadow(
                    blurRadius: 6,
                    color: Colors.brown.shade900,
                    offset: Offset(2, 2),
                  ),
                ],
                letterSpacing: 8,
              ),
            ),
          ),
        ),
      ),
    );
  }
}