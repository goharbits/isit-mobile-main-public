import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:isit_app/common/text_styles.dart';
import 'package:isit_app/constants/app_colors.dart';

import '../constants/app_fonts.dart';
import '../constants/app_sizes.dart';

class CustomDocumentSelectButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPress;

  const CustomDocumentSelectButton(
      {super.key,
      required this.text,
      required this.onPress,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: AppPadding.p8, horizontal: AppPadding.p8),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppSize.s30.r),
            boxShadow: [
              BoxShadow(
                  color: AppColors.shadowColor.withOpacity(0.12),
                  offset: Offset(0, 2.63.h),
                  blurRadius: AppSize.s17_2.r,
                  spreadRadius: 4)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Home icon with background
            Container(
              height: AppSize.s50.h,
              width: AppSize.s50.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s10.r),
                border: Border.all(
                  color: Colors.transparent,
                  width: AppSize.s1.w,
                ),
              ),
              child: CircleAvatar(
                radius: 50.r,
                backgroundColor: AppColors.darkBlueWithOpacity,
                child: Icon(
                  icon,
                  size: 30,
                  color: AppColors.darkBlue,
                ),
              ),
            ),
            SizedBox(width: AppSize.s20.w),
            // Other icons
            Text(
              text.tr,
              style: getSemiBoldStyle(
                  color: AppColors.textColor, fontSize: FontSize.s15),
            )
          ],
        ),
      ),
    );
  }
}
