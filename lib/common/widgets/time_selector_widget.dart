// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:isit_app/common/controller/week_days_time_controller.dart';
// import 'package:isit_app/constants/app_colors.dart';
//
// import '../../constants/app_sizes.dart';
// import '../text_styles.dart';
//
// class TimeSelectorWidget extends StatelessWidget {
//   final int dayIndex;
//
//   TimeSelectorWidget({super.key, required this.dayIndex});
//   final WeekDaysTimeController controller = Get.put(WeekDaysTimeController());
//
//   Future<void> selectTime(BuildContext context, bool isStartTime) async {
//     final TimeOfDay? picked = await showTimePicker(
//       context: context,
//       initialTime: isStartTime
//           ? controller.startTimes[dayIndex]
//           : controller.endTimes[dayIndex],
//     );
//     if (picked != null) {
//       controller.updateTime(dayIndex, isStartTime, picked);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() => Container(
//           padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.0.w),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Text(
//                 _dayName(dayIndex),
//                 style: getMediumStyle(color: AppColors.cursedBlack),
//               ),
//               GestureDetector(
//                 onTap: () => selectTime(context, true),
//                 child: Container(
//                   width: 94.w,
//                   height: 33.h,
//                   decoration: BoxDecoration(
//                       color: AppColors.white,
//                       borderRadius: BorderRadius.circular(AppSize.s22_5.r),
//                       border: Border.all(width: 1.w, color: AppColors.grey),
//                       boxShadow: [
//                         BoxShadow(
//                             color: AppColors.shadowColor.withOpacity(0.12),
//                             offset: Offset(0, 2.63.h),
//                             blurRadius: AppSize.s17_2.r,
//                             spreadRadius: 0)
//                       ]),
//                   child: Center(
//                     child: Text(
//                       textAlign: TextAlign.center,
//                       controller.startTimes[dayIndex].format(context),
//                       style: getMediumStyle(color: AppColors.cursedBlack),
//                     ),
//                   ),
//                 ),
//               ),
//               Text(
//                 'To',
//                 style: getMediumStyle(color: AppColors.labelTextColor),
//               ),
//               GestureDetector(
//                 onTap: () => selectTime(context, false),
//                 child: Container(
//                     width: 94.w,
//                     height: 33.h,
//                     decoration: BoxDecoration(
//                         color: AppColors.white,
//                         borderRadius: BorderRadius.circular(AppSize.s22_5.r),
//                         border: Border.all(width: 1.w, color: AppColors.grey),
//                         boxShadow: [
//                           BoxShadow(
//                               color: AppColors.shadowColor.withOpacity(0.12),
//                               offset: Offset(0, 2.63.h),
//                               blurRadius: AppSize.s17_2.r,
//                               spreadRadius: 0)
//                         ]),
//                     child: Center(
//                         child: Text(
//                       controller.endTimes[dayIndex].format(context),
//                       style: getMediumStyle(color: AppColors.cursedBlack),
//                     ))),
//               ),
//             ],
//           ),
//         ));
//   }
//
//   String _dayName(int index) {
//     const days = [
//       'Monday',
//       'Tuesday',
//       'Wednesday',
//       'Thursday',
//       'Friday',
//       'Saturday',
//       'Sunday'
//     ];
//     return days[index];
//   }
// }
