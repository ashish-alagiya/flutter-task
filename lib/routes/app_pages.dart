import 'package:flutter_assignment_app/pages/basic_information/binding/binding.dart';
import 'package:flutter_assignment_app/pages/basic_information/presentation/views/basic_information_screen.dart';
import 'package:flutter_assignment_app/pages/campaign_matching/binding/binding.dart';
import 'package:flutter_assignment_app/pages/campaign_matching/presentation/views/compaign_matching_screen.dart';
import 'package:flutter_assignment_app/pages/my_information/binding/binding.dart';
import 'package:flutter_assignment_app/pages/my_information/presentation/views/my_information_screen.dart';
import 'package:flutter_assignment_app/pages/profile/binding/binding.dart';
import 'package:flutter_assignment_app/pages/profile/presentation/views/profile_screen.dart';
import 'package:flutter_assignment_app/pages/set_password/binding/binding.dart';
import 'package:flutter_assignment_app/pages/set_password/presentation/views/set_password_screen.dart';
import 'package:flutter_assignment_app/pages/splash/binding/binding.dart';
import 'package:flutter_assignment_app/pages/splash/presentation/views/splash_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'app_routes.dart';

class AppPages {
  static const initial = AppRoutes.splash;
  static const profileScreen = AppRoutes.profileScreen;
  static const campaignMatchingScreen = AppRoutes.campaignMatchingScreen;
  static const myInformationScreen = AppRoutes.myInformationScreen;
  static const basicInformationScreen = AppRoutes.basicInformationScreen;
  static const setPasswordScreen = AppRoutes.setPasswordScreen;

  static final routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashScreen(),
      bindings: [SplashBinding()],
    ),
    GetPage(
      name: AppRoutes.profileScreen,
      page: () => ProfileScreen(),
      bindings: [ProfileBinding()],
    ),
    GetPage(
      name: AppRoutes.campaignMatchingScreen,
      page: () => CampaignMatchingScreen(),
      bindings: [CompaignMatchingBinding()],
    ),
    GetPage(
      name: AppRoutes.myInformationScreen,
      page: () => MyInformationScreen(),
      bindings: [MyInformationBinding()],
    ),
    GetPage(
      name: AppRoutes.basicInformationScreen,
      page: () => BasicInformationScreen(),
      bindings: [BasicInformationBinding()],
    ),
    GetPage(
      name: AppRoutes.setPasswordScreen,
      page: () => SetPasswordScreen(),
      bindings: [SetPasswordBinding()],
    ),
  ];
}
