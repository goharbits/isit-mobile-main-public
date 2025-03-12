import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isit_app/common/text_styles.dart';

import '../constants/app_colors.dart';
import '../constants/app_fonts.dart';
import '../constants/app_sizes.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final hintText;
  const CustomSearchBar({super.key, required this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p15.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSize.s30.r),
        border: Border.all(
            color: AppColors.darkBlueWithOpacity, width: AppSize.s1.w),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: Colors.grey),
          SizedBox(width: AppSize.s10.w),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '$hintText',
                  hintStyle: getRegularStyle(
                      color: AppColors.toggleIcon, fontSize: FontSize.s14)),
            ),
          ),
        ],
      ),
    );
  }
}
