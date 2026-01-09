import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

   startSplashscreen() async {
    var duration = const Duration(seconds: 3);

    return Timer(duration, () {
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
      Get.offAndToNamed("/login");
    });
  }

  @override
  void initState() {
    startSplashscreen();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/bg_app.png'), fit: BoxFit.fill)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Image.asset('assets/ic_logo_app.png'),
        ),
      ),
    );
  }
}