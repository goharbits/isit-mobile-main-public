import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:isit_app/modules/corporate/data/controller/company_employee_controller.dart';

import '../../../../common/text_styles.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_fonts.dart';
import '../../../../constants/app_sizes.dart';

class CompanyDocumentCard extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final bool isActive;
  final int servicesCount;
  final Function(bool) onToggle;

  const CompanyDocumentCard({
    required this.name,
    required this.email,
    required this.phone,
    required this.isActive,
    required this.servicesCount,
    required this.onToggle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final CompanyEmployeeController viewModel =
        Get.put(CompanyEmployeeController());

    return Obx(
      () => Container(
        height: 151.h,
        width: 151.h,
        padding: EdgeInsets.only(left: 10.w, right: 20.w, top: 5.h),
        //margin: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(23.73.r),
          border: Border.all(
              color: viewModel.isSwitch.value
                  ? AppColors.darkBlueWithOpacity
                  : AppColors.grey),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // padding: EdgeInsets.only(left: 10.w),
              decoration: BoxDecoration(
                  //color: ColorManager.darkBlue,
                  ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: AppSize.s45.h,
                    width: AppSize.s45.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSize.s50.r),
                      border: Border.all(
                        color: AppColors.grey,
                        width: AppSize.s1.w,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 50.r,
                      backgroundColor: AppColors.grey,
                      child: Icon(
                        Icons.person,
                        size: 30.w,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  //SizedBox(width: AppSize.s15.w,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 25.w,
                        height: 12.h,
                        child: Text(
                          'View',
                          style: getSemiBoldStyle(
                            color: AppColors.darkBlue,
                            fontSize: FontSize.s10,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Container(
                        width: 30.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                            color: AppColors.darkBlue,
                            borderRadius: BorderRadius.circular(40.r)),
                        child: Icon(
                          Icons.visibility,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 7.h,
            ),
            Text(
              name,
              //textAlign: TextAlign.center,
              style: getBoldStyle(
                  fontSize: AppSize.s16, color: AppColors.darkBlue),
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              children: [
                Icon(Icons.email, color: AppColors.darkBlue, size: 16),
                const SizedBox(width: 4),
                Text(email),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              children: [
                Icon(Icons.phone, color: AppColors.darkBlue, size: 16),
                SizedBox(width: 4.w),
                Text(phone),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                Icon(Icons.settings, color: AppColors.darkBlue, size: 16),
                SizedBox(width: 4),
                Text('Services ($servicesCount)'),
              ],
            ),
            SizedBox(
              height: 4.h,
            ),
          ],
        ),
      ),
    );
  }
}
