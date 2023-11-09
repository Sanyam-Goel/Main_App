import 'dart:async';
import 'package:flutter/material.dart';
import 'package:project_one/onboard/onboard.dart';
//import '../home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    //SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlayStyle.top]);
    Timer(const Duration(seconds: 2),
          ()=>Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder:
                                                          (context) => 
                                                          const OnBoard()
                                                         )
                                       )
         );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/splash_img.png'), // Replace with your image asset path
            fit: BoxFit.fill, // Make the image cover the full screen
          ),
        ),
      ),
    );
  }
}