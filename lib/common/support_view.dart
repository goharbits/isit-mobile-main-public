import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'text_styles.dart';
import '../constants/app_colors.dart';
import '../constants/app_fonts.dart';
import '../constants/app_sizes.dart';

class SupportView extends StatelessWidget {
  final VoidCallback onPress;

  const SupportView({
    super.key,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: 311.w,
        height: 45.h,
        padding: EdgeInsets.symmetric(horizontal: AppPadding.p18.w),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppSize.s30.r),
            boxShadow: [
              BoxShadow(
                  color: AppColors.shadowColor.withOpacity(0.12),
                  offset: Offset(0, 2.63.h),
                  blurRadius: AppSize.s17_2.r,
                  spreadRadius: 0)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Home icon with background
            Row(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: AppSize.s13.h,
                  width: AppSize.s19.w,
                  // padding: EdgeInsets.symmetric(horizontal: AppSize.s8.w,),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSize.s10.r),
                    border: Border.all(
                      color: Colors.transparent,
                      width: AppSize.s1.w,
                    ),
                  ),
                  child: Icon(
                    Icons.email,
                    color: AppColors.darkBlue,
                  ),
                ),
                SizedBox(width: AppSize.s20.w),
                Text(
                  'Lorem@lorem.com',
                  style: getMediumStyle(
                    color: AppColors.labelTextColor,
                    fontSize: FontSize.s14,
                  ),
                ),
                // Other icons
                SizedBox(width: AppSize.s10.w),
              ],
            ),
            // Add space before the timestamp
            SizedBox(width: 17.w, height: 18.h, child: Icon(Icons.send))
          ],
        ),
      ),
    );
  }
}
