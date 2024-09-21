import 'dart:async';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/views/home/home_screen.dart';


import '../../utlis/text_style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
              (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.sizeOf(context).height;
    return Scaffold(
        backgroundColor: Colors.blue.withOpacity(.4),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
         Lottie.asset("assets/ani.json",height: sizeH*.2),
               SizedBox(
                height: sizeH*.02,
              ),
              HeadingTwo(
                data: 'Weather App',
                fontSize: sizeH*.035,
              )
            ],
          ),
        ));
  }
}