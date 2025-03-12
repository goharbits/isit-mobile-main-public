import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:isit_app/constants/app_colors.dart';
import 'package:isit_app/modules/corporate/presentation/widgets/company_drawer.dart';

import '../../../../../common/custom_back_icon.dart';
import '../../../../../common/custom_button.dart';
import '../../../../../common/custome_text_field.dart';
import '../../../../../common/text_styles.dart';
import '../../../../../constants/app_fonts.dart';
import '../../../../../constants/app_sizes.dart';

class AppChangePassword extends StatefulWidget {
  const AppChangePassword({super.key});

  @override
  State<AppChangePassword> createState() => _CompanyChangePasswordState();
}

class _CompanyChangePasswordState extends State<AppChangePassword> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CompanyDrawer(),
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
                            'Password Change',
                            style: getBoldStyle(
                                color: AppColors.textColor,
                                fontSize: FontSize.s18),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSize.s47.h),
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
                          padding: EdgeInsets.symmetric(
                              horizontal: AppSize.s24.w,
                              vertical: AppSize.s24.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    Text(
                                      "Password Change",
                                      style: getBoldStyle(
                                          color: Colors.black, fontSize: 18),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                        "Enter your email, and an OTP will be \n sent to you on it.",
                                    textAlign: TextAlign.center,)
                                  ],
                                ),
                              ),
                              SizedBox(height: 30),
                              CustomTextField(
                                  labelText: 'Email',
                                  hintText: 'Email',
                                  controller: emailController),
                              SizedBox(height: AppSize.s27.h),
                              CustomButton(onPress: () {}, text: 'Continue'),
                              SizedBox(
                                height: AppSize.s136,
                              ),
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
