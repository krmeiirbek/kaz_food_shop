import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaz_food_shop/routes/route_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.linear);
    Timer(
      const Duration(seconds: 3),
      () => Get.offNamed(RouteHelper.getInitial()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: animation,
            child: Center(
              child: Image.asset(
                'assets/images/logo part 1.png',
                width: 250,
              ),
            ),
          ),
          Center(
            child: Image.asset(
              'assets/images/logo part 2.png',
              width: 250,
            ),
          ),
        ],
      ),
    );
  }
}
