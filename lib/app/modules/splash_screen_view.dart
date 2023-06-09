import 'package:flextrip/app/controllers/utility_controller.dart';
import 'package:flextrip/services/app_cycle_service.dart';
import 'package:flextrip/styles/colors.dart';
import 'package:flextrip/styles/styles.dart';
import 'package:flextrip/utils/app_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  final cUtility = Get.find<UtilityController>();
  double width = Get.width * 0.1;
  double fontSize = 16.w;

  @override
  void initState() {
    cUtility.getAppLanguage();
    startAnimation();
    checkRoute();
    super.initState();
  }

  Future<void> startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 100));
    if (mounted) {
      setState(() {
        width = Get.width * 0.45;
        fontSize = 20.w;
      });
    }
  }

  Future<void> checkRoute() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    await AppCycleService().checkTokenAndRoute();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.myColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 1000),
              width: width,
              height: width,
              child: Image.asset(AppAsset.logo('logo_app.png')),
            ),
            Text(
              'FLEXITRIP',
              style: TextStyles.title.copyWith(
                color: Colors.white,
                letterSpacing: 8.w,
                fontSize: fontSize,
              ),
            ),
            Text(
              'فليكسيتريب',
              style: TextStyles.title.copyWith(
                color: Colors.white,
                letterSpacing: 8.w,
                fontSize: fontSize,
              ),
            )
          ],
        ),
      ),
    );
  }
}
