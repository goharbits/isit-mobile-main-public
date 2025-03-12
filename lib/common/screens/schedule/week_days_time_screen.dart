import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:isit_app/common/controller/week_days_time_controller.dart';
import 'package:isit_app/constants/app_colors.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_fonts.dart';
import '../../../constants/app_sizes.dart';
import '../../custom_back_icon.dart';
import '../../custom_button.dart';
import '../../text_styles.dart';
import '../../widgets/days_selector_widget.dart';

class WeekDaysTimeScreen extends StatefulWidget {
  const WeekDaysTimeScreen({super.key});

  @override
  State<WeekDaysTimeScreen> createState() => _WeekDaysTimeScreenState();
}

class _WeekDaysTimeScreenState extends State<WeekDaysTimeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WeekDaySelectionProvider>(context);
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: AppSize.s60.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSize.s24.w),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomBackIcon(),
                      SizedBox(
                        width: AppSize.s45.w,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Work Day & Time',
                          style: getBoldStyle(
                              color: AppColors.textColor,
                              fontSize: FontSize.s18),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: AppSize.s47.h,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: Get.width,
                      height: MediaQuery.sizeOf(context).height * 0.82,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(AppSize.s50.r),
                          topRight: Radius.circular(AppSize.s50.r),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppSize.s15.w, vertical: AppPadding.p8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: AppSize.s27.h,
                            ),
                            Text(
                              'Select Week Days',
                              style: getBoldStyle(
                                  color: AppColors.textColor,
                                  fontSize: FontSize.s18),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: AppSize.s10.h,
                            ),
                            DaySelectorWidget(),
            
                            SizedBox(
                              height: AppSize.s10.h,
                            ),
                            Text(
                              'Timings',
                              style: getSemiBoldStyle(
                                  color: AppColors.textColor,
                                  fontSize: FontSize.s18),
                              textAlign: TextAlign.center,
                            ),
            
                            SizedBox(
                              height: AppSize.s10.h,
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  activeColor: AppColors.darkBlue,
                                  value: provider.isSameForAllDays,
                                  onChanged: (value) {
                                    provider.setSameForAllDays(value ?? false);
                                  },
                                ),
                                Text("Same for all days"),
                                SizedBox(width: 20),
                                Checkbox(
                                  activeColor: AppColors.darkBlue,
                                  value: !provider.isSameForAllDays,
                                  onChanged: (value) {
                                    provider
                                        .setSameForAllDays(!(value ?? false));
                                  },
                                ),
                                Text("Different for all days"),
                              ],
                            ),
                            // Obx(() => Row(
                            //       mainAxisAlignment:
                            //           MainAxisAlignment.spaceBetween,
                            //       children: [
                            //         Expanded(
                            //           child: CheckboxListTile(
                            //             title: Text(
                            //               "Same for all days",
                            //               style: getMediumStyle(
                            //                   color: AppColors.labelTextColor,
                            //                   fontSize: FontSize.s12),
                            //             ),
                            //             value: daytimeViewmodel
                            //                 .isSameForAllDays.value,
                            //             activeColor: AppColors.darkBlue,
                            //             onChanged: (value) {
                            //               daytimeViewmodel
                            //                   .toggleSameForAllDays(value!);
                            //               daytimeViewmodel
                            //                   .updateDaysSelection();
                            //             },
                            //           ),
                            //         ),
                            //         Expanded(
                            //           child: CheckboxListTile(
                            //             title: Text("Different for all days",
                            //                 style: getMediumStyle(
                            //                     color:
                            //                         AppColors.labelTextColor,
                            //                     fontSize: FontSize.s12)),
                            //             activeColor: AppColors.darkBlue,
                            //             value: !daytimeViewmodel
                            //                 .isSameForAllDays.value,
                            //             onChanged: (value) {
                            //               daytimeViewmodel
                            //                   .toggleSameForAllDays(!value!);
                            //               daytimeViewmodel
                            //                   .updateDaysSelection(); // Update selection logic
                            //             },
                            //           ),
                            //         ),
                            //       ],
                            //     )),
                            Expanded(
                              child: ListView.builder(
                                itemCount: provider.selectedDays.length,
                                itemBuilder: (context, index) {
                                  final day = provider.selectedDays[index];
                                  final timeRange = provider.getTimeRange(day);
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        day,
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      Row(
                                        children: [
                                          // Start Time Picker Button
                                          InkWell(
                                            onTap: () async {
                                              TimeOfDay? selectedTime =
                                                  await showTimePicker(
                                                context: context,
                                                initialTime:
                                                    timeRange.startTime,
                                              );
                                              if (selectedTime != null) {
                                                provider.setStartTime(
                                                    day, selectedTime);
                                              }
                                            },
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 6, vertical: 5),
                                              decoration: BoxDecoration(
                                                  color: Color(0xFFE3E3E5),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  border: Border.all(
                                                      color: Colors.black)),
                                              child: Text(
                                                timeRange.startTime.format(context),
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                          Text("to"),
                                          // End Time Picker Button
                                          InkWell(
                                            onTap: () async {
                                              TimeOfDay? selectedTime =
                                                  await showTimePicker(
                                                context: context,
                                                initialTime:
                                                    timeRange.endTime,
                                              );
                                              if (selectedTime != null) {
                                                provider.setEndTime(
                                                    day, selectedTime);
                                              }
                                            },
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 5),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 6, vertical: 5),
                                              decoration: BoxDecoration(
                                                  color: Color(0xFFE3E3E5),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  border: Border.all(
                                                      color: Colors.black)),
                                              child: Text(
                                                timeRange.endTime.format(context),
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
            
                            CustomButton(onPress: (){
                            }, text: 'Update'),
                            SizedBox(height: 40)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
