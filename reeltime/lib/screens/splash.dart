import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:reeltime/app.dart';
import 'package:reeltime/screens/navigation.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {



  @override
  void initState() {
    
    super.initState();
    Timer( const Duration(seconds: 2),  (){  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const NavigationScreen() ,));     });

  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:  Image.asset(
          'assets/images/logo.png',
          width: 150.w,
        )
      ),
    );
  }
}