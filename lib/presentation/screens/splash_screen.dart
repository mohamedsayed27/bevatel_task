import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/assets_path/images_path.dart';
import '../../core/app_router/screens_name.dart';
import '../../core/theme/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<AlignmentGeometry>? scaleAnimation;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    scaleAnimation = Tween<AlignmentGeometry>(
      begin:Alignment.topCenter,
      end: Alignment.center,
    ).animate(CurvedAnimation(parent: controller!, curve: Curves.easeInOut));
    controller!.repeat(reverse: true,);
    _loading();
    super.initState();
  }

  _loading() {
    Timer(
      const Duration(seconds: 3),
          () {
        Navigator.pushReplacementNamed(context, ScreenName.mainLayoutScreen);
          },
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values); // t
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whitColor,
      body: Center(
        child: SizedBox(
          height: 350.h,
          child: AlignTransition(
            alignment: scaleAnimation!,
            child: SizedBox(
              height: 310.h,
              child: Image.asset(
                ImagesPath.bevLogo,
                width: 250.w,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
