import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_assignment_app/constants/colors.dart';
import 'package:flutter_assignment_app/constants/dimens.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: GetBuilder<SplashController>(
        init: SplashController(),
        builder: (controller) {
          return Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(color: AppColors.primaryColor),
            child: Center(
              child: Text(
                'MY FlYN',
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 40.sp,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
