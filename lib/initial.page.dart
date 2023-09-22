import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zig_zag_test/app/config/color_constants.dart';
import 'package:zig_zag_test/app/core/routes/app_pages.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Furpals',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: AppColors.whiteColor,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          titleTextStyle: TextStyle(
            color: AppColors.blackColor,
          ),
          iconTheme: IconThemeData(
            color: AppColors.whiteColor,
          ),
        ),
      ),
      defaultTransition: Transition.fade,
      initialRoute: Routes.USER_LIST_SCREEN,
      getPages: AppPages.pages,
    );
  }
}
