import 'package:flutter/material.dart';
import 'package:flutter_assignment_app/pages/splash/binding/binding.dart';
import 'package:flutter_assignment_app/routes/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'constants/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

TextTheme textTheme = Theme.of(Get.context!).textTheme;

class GlobalVariable {
  static final GlobalKey<ScaffoldMessengerState> navState =
      GlobalKey<ScaffoldMessengerState>();
}

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: ScreenUtilInit(
        designSize: Size(375, 867),
        minTextAdapt: true,
        rebuildFactor: RebuildFactors.size,
        builder:
            (context, widget) => GetMaterialApp(
              navigatorObservers: [routeObserver],
              title: 'Flutter Assignment',
              initialBinding: SplashBinding(),
              initialRoute: AppPages.initial,
              theme: ThemeConfig.lightTheme,
              getPages: AppPages.routes,
              scaffoldMessengerKey: GlobalVariable.navState,
              debugShowCheckedModeBanner: false,
              enableLog: true,
              defaultTransition: Transition.cupertino,
              useInheritedMediaQuery: false,
            ),
      ),
    );
  }
}
