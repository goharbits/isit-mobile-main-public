import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../common/text_styles.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_fonts.dart';
import '../../../../constants/app_sizes.dart';
import '../../data/controller/company_employee_controller.dart';

class CompanyEmployeeCard extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final bool isActive;
  final int servicesCount;
  final Function(bool) onToggle;
  final bool gridView;

  const CompanyEmployeeCard({
    required this.name,
    required this.email,
    required this.phone,
    required this.isActive,
    required this.servicesCount,
    required this.onToggle,
    required this.gridView,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final CompanyEmployeeController employeeData = Get.put(CompanyEmployeeController());

    return Obx(
      () => gridView == true ? Container(
        height: 151.h,
        width: 151.h,
        padding: EdgeInsets.only(left: 10.w, right: 20.w, top: 5.h),
        //margin: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
          color: Color(0xFFF7F7F7),
          borderRadius: BorderRadius.circular(23.73.r),
          border: Border.all(
              color: employeeData.isSwitch.value
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
                      backgroundColor: Color(0xFFDADADA),
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
                      Text(
                        employeeData.isSwitch.value ? 'Active' : 'InActive',
                        style: getRegularStyle(
                          color: AppColors.toggleIcon,
                          fontSize: FontSize.s10,
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Container(
                        width: 28.w,
                        height: 15.h,
                        decoration: BoxDecoration(border: Border.all()),
                        child: Switch(
                          value: employeeData.isSwitch.value,
                          onChanged: (value) {
                            employeeData.isSwitch.value = value;
                          },
                          trackOutlineColor:
                              WidgetStateProperty.all(Colors.transparent),
                          activeColor: AppColors.darkBlue,
                          inactiveThumbColor: Colors.white,
                          activeTrackColor: AppColors.darkBlue,
                          thumbColor: WidgetStateProperty.all(AppColors.white),
                          inactiveTrackColor: AppColors.grey,
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
      )
      : Container(
        height: 100.h,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        //margin: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
          color: Color(0xFFF7F7F7),
          borderRadius: BorderRadius.circular(23.73.r),
          border: Border.all(
              color: employeeData.isSwitch.value
                  ? AppColors.darkBlueWithOpacity
                  : AppColors.grey),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
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
                backgroundColor: Color(0xFFDADADA),
                child: Icon(
                  Icons.person,
                  size: 30.w,
                  color: AppColors.white,
                ),
              ),
            ),
            SizedBox(width: 5),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  //textAlign: TextAlign.center,
                  style: getBoldStyle(
                      fontSize: AppSize.s16, color: AppColors.darkBlue),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Row(
                  children: [
                    Icon(Icons.email, color: AppColors.darkBlue, size: 16),
                    const SizedBox(width: 4),
                    Text(email),
                  ],
                ),
                SizedBox(
                  height: 6.h,
                ),
                Row(
                  children: [
                    Icon(Icons.settings, color: AppColors.darkBlue, size: 16),
                    SizedBox(width: 4),
                    Text('Services ($servicesCount)'),
                  ],
                ),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      employeeData.isSwitch.value ? 'Active' : 'InActive',
                      style: getRegularStyle(
                        color: AppColors.toggleIcon,
                        fontSize: FontSize.s10,
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Container(
                      width: 28.w,
                      height: 15.h,
                      margin: EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(border: Border.all()),
                      child: Switch(
                        value: employeeData.isSwitch.value,
                        onChanged: (value) {
                          employeeData.isSwitch.value = value;
                        },
                        trackOutlineColor:
                        WidgetStateProperty.all(Colors.transparent),
                        activeColor: AppColors.darkBlue,
                        inactiveThumbColor: Colors.white,
                        activeTrackColor: AppColors.darkBlue,
                        thumbColor: WidgetStateProperty.all(AppColors.white),
                        inactiveTrackColor: AppColors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Icon(Icons.phone, color: AppColors.darkBlue, size: 16),
                    SizedBox(width: 4.w),
                    Text(phone),
                  ],
                ),
              ],
            ),
          ],
        ),
      ) ,
    );
  }
}
