import 'package:ecomanga/features/onbording_screens/on_bording_screen.dart';
import 'package:ecomanga/features/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _init();
    });

    super.initState();
  }

  _init() async {
    Utils.go(context: context, screen: const OnbordingScreen(), replace: true);

    // FirebaseAuth.instance.currentUser == null
    //     ? Utils.go(
    //         context: context,
    //         screen: const OnbordingScreen(),
    //         replace: true,
    //       )
    //     : Utils.go(
    //         context: context,
    //         screen: const OnbordingScreen(),
    //         replace: true,
    //       );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/images/app_icon.png",
          height: 200.h,
          width: 200.w,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
