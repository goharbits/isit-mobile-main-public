import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:isit_app/app/routes/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_,child){
        //FlutterStatusbarcolor.setStatusBarColor(Colors.white);

        return   GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'iSit App',
          // locale: Locale(LocaleConstants.english),
          // fallbackLocale: Locale(LocaleConstants.english),
          // translations: AppTranslations(),
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2C2CFF)),
            useMaterial3: true,
          ),
          initialRoute: AppRoutes.splash,
          getPages: AppRoutes.routes,
          builder: DevicePreview.appBuilder,
        );
      },
    );
  }
}






