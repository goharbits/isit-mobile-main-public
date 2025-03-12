import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/text_styles.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_fonts.dart';
import '../../../../constants/app_sizes.dart';

class CompanyDashboardCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String count;

  const CompanyDashboardCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 151.h,
      width: 151.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 5.h),
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(23.73.r),
        border: Border.all(color: AppColors.darkBlueWithOpacity),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: 56.w,
              height: 53.h,
              child: Image.asset(imageUrl,height: 53.h,width: 56.w,)
          ),
          SizedBox(height: 10.h),
          Text(
            title,
            textAlign: TextAlign.center,
            style: getRegularStyle(fontSize: AppSize.s14_44, color: AppColors.textColor.withOpacity(.8)),
          ),
          SizedBox(height: AppSize.s10.h),
          Text(
            count,
            style: getBoldStyle(color: AppColors.darkBlue,fontSize: FontSize.s18_57),
          ),
        ],
      ),
    );
  }
}
