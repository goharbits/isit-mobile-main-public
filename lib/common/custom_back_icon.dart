import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';
import '../constants/app_assets.dart';

class CustomBackIcon extends StatelessWidget {
  const CustomBackIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        width: AppSize.s35.w,
        height: AppSize.s35.h,
        decoration: BoxDecoration(
            border: Border.all(
                width: AppSize.s1.w,
                color: AppColors.backButtonBorder
            ),
            borderRadius: BorderRadius.circular(AppSize.s8.r)

        ),
        child: GestureDetector(
            onTap: (){
              handleBackNavigation(context,_scaffoldKey);

              //Get.back();
            },
            child: SizedBox(
                width: 12.w,
                height: 6.w,
                child: Image.asset(AppAssets.backIcon))
        ),
      ),
    );
  }
  void handleBackNavigation(BuildContext context, GlobalKey<ScaffoldState> scaffoldKey) {
    // Use Scaffold.of(context) to get the current ScaffoldState
    final scaffoldState = Scaffold.of(context);

    if (scaffoldState.isDrawerOpen) {
      // Close the drawer if it's open
      scaffoldState.closeDrawer();
    } else {
      // Navigate back using Get
      Get.back();
    }
  }
}
