import 'dart:async';

import 'package:driver_apps/logIn_screen/login.dart';
import 'package:flutter/material.dart';

import '../home_screen/home.dart';
import '../main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      if (prefs?.getBool("islogin") == true) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>const HomeScreen(),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
     body: Center(
        child: Image.asset(
         'assets/logo.png',
         fit: BoxFit.contain,
          //width: MediaQuery.of(context).size.width / 1.2,
        ),
      ),
    );
  }
}