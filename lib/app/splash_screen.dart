import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isit_app/app/routes/app_routes.dart';

import '../constants/app_assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  startTimer(){
    Timer(const Duration(seconds: 3),() async{
      Get.offAllNamed(AppRoutes.appSignIn);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppAssets.splashBanner1,),
            fit: BoxFit.cover
          )
        ),
        child: Center(
          child: Image.asset(AppAssets.splashLogo),
        ),
      ),
    );
  }
}
