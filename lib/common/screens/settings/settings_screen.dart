import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../app/routes/app_routes.dart';
import '../../../../common/custom_back_icon.dart';
import '../../../../common/text_styles.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_fonts.dart';
import '../../../../constants/app_sizes.dart';
import '../../controller/settings_controller.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final SettingsController settingsViewmodel = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: AppSize.s20.h,
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
                            'Settings',
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
                    //clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: Get.width,
                        height: Get.height,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(AppSize.s50.r),
                            topRight: Radius.circular(AppSize.s50.r),
                          ),
                        ),
                        child: Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: AppSize.s24.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: AppSize.s20.h),
                              Container(
                                padding: EdgeInsets.only(left: 10.w),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: SizedBox(
                                          width: AppSize.s250.w,
                                          height: AppSize.s50.h,
                                          child: CustomSettingsListTile(
                                            icon: Icons.notifications,
                                            text: 'App Notification',
                                            onPress: () {},
                                            iconColor: AppColors.darkBlue,
                                            textColor: AppColors.textColor,
                                          )),
                                    ),
                                    Obx(
                                          () => SizedBox(
                                        width: AppSize.s100.w,
                                        height: AppSize.s50.h,
                                        child: Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              settingsViewmodel.isSwitch.value == true ?
                                              "On" : "Off",
                                              style: getMediumStyle(
                                                color: AppColors.toggleIcon,
                                                fontSize: FontSize.s12,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20.w,
                                            ),
                                            Container(
                                              width: 28.w,
                                              height: 15.h,
                                              decoration: BoxDecoration(
                                                  border: Border.all()),
                                              child: Switch(
                                                value: settingsViewmodel
                                                    .isSwitch.value,
                                                onChanged: (value) {
                                                  settingsViewmodel
                                                      .isSwitch.value = value;
                                                },
                                                trackOutlineColor:
                                                WidgetStateProperty.all(
                                                    Colors.transparent),
                                                activeColor:
                                                AppColors.darkBlue,
                                                inactiveThumbColor:
                                                Colors.white,
                                                activeTrackColor:
                                                AppColors.darkBlue,
                                                thumbColor:
                                                WidgetStateProperty.all(
                                                    AppColors.white),
                                                inactiveTrackColor:
                                                AppColors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                color:
                                Colors.grey, // Set the color of the divider
                                thickness: 1, // Set the thickness of the line
                              ),
                              Container(
                                  padding: EdgeInsets.only(left: 10.w),
                                  width: 200.w,
                                  height: 50.h,
                                  child: CustomSettingsListTile(
                                    icon: Icons.headphones,
                                    text: 'Support',
                                    onPress: () {
                                      Get.toNamed(AppRoutes.supportScreen);
                                    },
                                    iconColor: AppColors.darkBlue,
                                    textColor: AppColors.textColor,
                                  )),
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
      ),
    );
  }
}

class CustomSettingsListTile extends StatefulWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPress;
  Color? iconColor = AppColors.white;
  Color? textColor = AppColors.white;

  CustomSettingsListTile(
      {super.key,
        required this.icon,
        required this.text,
        required this.onPress,
        this.textColor,
        this.iconColor});

  @override
  State<CustomSettingsListTile> createState() => _CustomSettingsListTileState();
}

class _CustomSettingsListTileState extends State<CustomSettingsListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        widget.icon,
        color: widget.iconColor,
        size: 20.w,
      ),
      title: Text(widget.text,
          style: getMediumStyle(
              color: widget.textColor ?? AppColors.white,
              fontSize: FontSize.s16)),
      onTap: widget.onPress,
    );
  }
}
