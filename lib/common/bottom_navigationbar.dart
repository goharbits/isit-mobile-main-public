import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isit_app/common/text_styles.dart';

import '../constants/app_colors.dart';
import '../constants/app_fonts.dart';
import '../constants/app_sizes.dart';

class BottomBar extends StatelessWidget {
  final int selectedIndex;
  final VoidCallback index0;
  final VoidCallback index1;
  final VoidCallback index2;
  final VoidCallback index3;

  const BottomBar(
      {super.key,
      required this.selectedIndex,
      required this.index0,
      required this.index1,
      required this.index2,
      required this.index3});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 20,
      right: 20,
      bottom: 20,
      child: Container(
        padding: EdgeInsets.all(AppPadding.p12.w),
        decoration: BoxDecoration(
            color: AppColors.lightGrey,
            borderRadius: BorderRadius.circular(AppSize.s30.r),
            boxShadow: [
              BoxShadow(
                  color: AppColors.shadowColor.withOpacity(0.12),
                  offset: Offset(0, 2.63.h),
                  blurRadius: AppSize.s17_2.r,
                  spreadRadius: 0.r)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            selectedIndex == 0
                ? _selectedButton(Icons.home, 'Home')
                : GestureDetector(
                    onTap: index0,
                    child: Icon(Icons.home, color: AppColors.textColor),
                  ),

            SizedBox(width: AppSize.s20.w),
            // Other icons

            selectedIndex == 1
                ? _selectedButton(Icons.settings, 'Requests')
                : GestureDetector(
                    onTap: index1,
                    child: Icon(Icons.settings, color: AppColors.textColor),
                  ),

            SizedBox(width: AppSize.s20.w),
            selectedIndex == 2
                ? _selectedButton(Icons.chat_outlined, 'Chat')
                : GestureDetector(
                    onTap: index2,
                    child:
                        Icon(Icons.chat_outlined, color: AppColors.textColor),
                  ),

            SizedBox(width: AppSize.s20.w),
            selectedIndex == 3
                ? _selectedButton(Icons.person, 'Profile')
                : GestureDetector(
                    onTap: index3,
                    child: Icon(Icons.person, color: AppColors.textColor),
                  ),
          ],
        ),
      ),
    );
  }

  _selectedButton(IconData icon, String text) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: AppSize.s8.h, horizontal: AppSize.s16.w),
      decoration: BoxDecoration(
        color: AppColors.darkBlue,
        borderRadius: BorderRadius.circular(AppSize.s20.r),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.white),
          SizedBox(width: AppSize.s5.w),
          Text(
            text,
            style: getSemiBoldStyle(
                color: AppColors.white, fontSize: FontSize.s18),
          ),
        ],
      ),
    );
  }
}
