import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

const String splashImagePath = 'assets/images/splash_image.png';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      GoRouter.of(context).goNamed('login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: const Color(0xFF357ec5),
        child: Center(
          child: SizedBox(
            height: 180.h,
            width: 205.w,
            child: Image.asset(splashImagePath, fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }
}
