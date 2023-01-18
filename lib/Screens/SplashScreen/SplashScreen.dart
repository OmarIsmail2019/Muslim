import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:muslim/Screens/LayOut/HomeLayOut.dart';
import 'package:muslim/constant/AppColor.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        curve: Curves.easeInOutCubic,
        animationDuration: const Duration(milliseconds: 4000),
        duration: 2000,
        splash: Text(
          'الصراط المستقيم',
          style: TextStyle(
              fontSize: 50,
              fontFamily: 'UthmanicHafs',
              color: AppConstant.defaultIconAndTextColor,
              fontWeight: FontWeight.bold),
        ),
        nextScreen: const HomeLayOut(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: AppConstant.defaultAppBarColor);
  }
}
