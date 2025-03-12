import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constants/app_colors.dart';
import '../constants/app_fonts.dart';
import '../constants/app_sizes.dart';


class CustomButton extends StatelessWidget {
  final VoidCallback onPress;
  final String text;
  bool? isLoading = false;

  CustomButton({super.key, required this.onPress, required this.text, this.isLoading});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color:AppColors.shadowColor.withOpacity(0.12),
                offset: Offset(0, 2.63.h),
                blurRadius: AppSize.s17_2.r,
                spreadRadius: 0
            )
          ]
      ),
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.darkBlue, // Primary color for button
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s30.r), // Dynamic border radius
          ),
          padding: EdgeInsets.symmetric(vertical: AppPadding.p12.w), // Dynamic padding
        ),
        child: isLoading == true ? Center(child: CircularProgressIndicator(
          color: Colors.white))
        : Text(
            text.tr,
            style: TextStyle(
                color: AppColors.whiteText,
                fontFamily: FontConstants.fontFamily,
                fontWeight: FontWeightManager.semiBold,
                fontSize: FontSize.s18.sp
            )
        ),
      ),
    );
  }
}

