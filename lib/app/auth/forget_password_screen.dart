import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:isit_app/app/auth/otp_verification_screen.dart';
import 'package:isit_app/app/auth/services/api_auth_service.dart';
import 'package:isit_app/common/custom_toast.dart';

import '../../common/custom_back_icon.dart';
import '../../common/custom_button.dart';
import '../../common/custome_text_field.dart';
import '../../common/text_styles.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_fonts.dart';
import '../../constants/app_sizes.dart';
import '../../constants/app_strings.dart';
import '../routes/app_routes.dart';

class AppForgetPasswordScreen extends StatelessWidget {
  String title;
  AppForgetPasswordScreen({super.key, required this.title});

  final TextEditingController emailController=TextEditingController();
  final TextEditingController phoneController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: AppPadding.p20.w),
          child: Column(
            children: [
              //Back Button
              CustomBackIcon(),

              SizedBox(height: AppSize.s20.h),
              //Sign In Text
              Text(
                title,
                style: getBoldStyle(color: AppColors.textColor),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppSize.s20.h),

              Text(
                "Enter your email, and an OTP will be ",
                style: getMediumStyle(color: AppColors.labelTextColor),
                textAlign: TextAlign.center,
              ),Text(
                "sent to you on it.",
                style: getMediumStyle(color: AppColors.labelTextColor),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: AppSize.s47.h,),

              CustomTextField(
                  labelText: AppStrings.email.tr,
                  hintText: AppStrings.email.tr,
                  controller: emailController
              ),

              SizedBox(height: AppSize.s10.h,),

              SizedBox(height: AppSize.s16.h),
              CustomButton(
                  onPress: () async {
                    if (emailController.text.isNotEmpty) {
                      var response = await ApiAuthSevice.forgetPassword(
                          "/forget-password", emailController.text.toString());
                      if (response != null) {
                        Get.to(() => OtpVerificationScreen(email: emailController.text));
                      }
                    } else {
                      CustomToast.show(message: "Please Enter Email", backgroundColor: Colors.red);
                    }
                  },
                  text: AppStrings.continueText.tr
              ),

              SizedBox(height: AppSize.s16.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.rememberPassword.tr,
                    style: getMediumStyle(
                        color: AppColors.labelTextColor,
                        fontSize: FontSize.s15,
                    ),
                  ),
                  if (title == "Reset Password") ...[
                    TextButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.appSignIn,);
                      },
                      child: Text(AppStrings.signIn.tr,
                          style: getSemiBoldStyle(
                              color: AppColors.darkBlue,
                              fontSize: FontSize.s15
                          )
                      ),
                    ),
                  ]
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

