import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../common/text_styles.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_fonts.dart';
import '../../../../constants/app_sizes.dart';

class CompanyCustomCardButton extends StatelessWidget {
  final VoidCallback onPress;
  final String text;
  final Color backgroundColor;
  final Color textColor;

  const CompanyCustomCardButton(
      {super.key,
      required this.onPress,
      required this.text,
      this.textColor = Colors.black,
      this.backgroundColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110.w,
      height: AppSize.s30.h,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: AppColors.shadowColor.withOpacity(0.12),
            offset: Offset(0, 2.63.h),
            blurRadius: AppSize.s17_2.r,
            spreadRadius: 0)
      ]),
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor, // Background color
          //onPrimary: Colors.white, // Text color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s40.r),
            side: BorderSide(
                color: AppColors.grey,
                width: AppSize.s1.w), // Border color and width
          ),
        ),
        child: Text(
          text.tr,
          style: getRegularStyle(color: textColor, fontSize: FontSize.s15),
        ),
      ),
    );
  }
}
