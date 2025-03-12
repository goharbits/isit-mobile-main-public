import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'text_styles.dart';
import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';
import '../modules/corporate/data/controller/company_employee_controller.dart';

class RequestsCard extends StatelessWidget {
  final String name;
  final String service;
  final String hiredBy;
  final String date;
  final String hour;

  const RequestsCard({
    required this.name,
    required this.service,
    required this.hiredBy,
    required this.date,
    required this.hour,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final CompanyEmployeeController employeeData = Get.put(CompanyEmployeeController());

    return Obx(
          () => Container(
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
                    Text(service),
                  ],
                ),
                SizedBox(
                  height: 6.h,
                ),
                Row(
                  children: [
                    Icon(Icons.settings, color: AppColors.darkBlue, size: 16),
                    SizedBox(width: 4),
                    Text('Hired by: $hiredBy'),
                  ],
                ),
              ],
            ),
            Spacer(),
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.calendar_month, color: AppColors.darkBlue, size: 16),
                    SizedBox(width: 4),
                    Text(date)
                  ],
                ),
                Spacer(),
                RichText(
                  text: TextSpan(
                    text: hour,
                    style: TextStyle(color: AppColors.darkBlue),
                    children: const <TextSpan>[
                      TextSpan(text: '/hr', style: TextStyle(color: Colors.black)),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ) ,
    );
  }
}
