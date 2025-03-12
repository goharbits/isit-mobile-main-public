import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:isit_app/app/auth/services/api_auth_service.dart';
import 'package:isit_app/app/auth/signin_screen.dart';

import '../../common/custom_back_icon.dart';
import '../../common/custom_button.dart';
import '../../common/custom_toast.dart';
import '../../common/custome_text_field.dart';
import '../../common/text_styles.dart';
import '../../constants/app_assets.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_sizes.dart';
import '../../constants/app_strings.dart';

class AppCreateNewPasswordScreen extends StatefulWidget {
  String email, otp;
  AppCreateNewPasswordScreen({super.key, required this.email, required this.otp});

  @override
  State<AppCreateNewPasswordScreen> createState() =>
      _AppCreateNewPasswordScreenState();
}

class _AppCreateNewPasswordScreenState
    extends State<AppCreateNewPasswordScreen> {
  final TextEditingController newPasswordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  late String email;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    email = widget.email;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p24.w),
          child: Column(
            children: [
              //Back Button
              CustomBackIcon(),
              SizedBox(height: AppSize.s20.h),
              //Sign In Text
              Text(
                AppStrings.createNewPassword.tr,
                style: getBoldStyle(color: AppColors.textColor),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppSize.s20.h),

              Container(
                padding: EdgeInsets.symmetric(horizontal: AppPadding.p50.w),
                child: Text(
                  AppStrings.createNewPasswordPara.tr,
                  style: getMediumStyle(color: AppColors.labelTextColor),
                  textAlign: TextAlign.center,
                ),
              ),

              SizedBox(
                height: AppSize.s47.h,
              ),

              CustomTextField(
                  labelText: AppStrings.newPassword.tr,
                  hintText: AppStrings.newPassword.tr,
                  isPasswordField: true,
                  controller: newPasswordController),

              SizedBox(height: AppSize.s16.h),
              CustomTextField(
                  labelText: AppStrings.confirmPassword.tr,
                  hintText: AppStrings.confirmPassword.tr,
                  isPasswordField: true,
                  controller: confirmPasswordController),

              SizedBox(height: AppSize.s24.h),

              CustomButton(
                  onPress: () async {
                    if (newPasswordController.text.isNotEmpty && confirmPasswordController.text.isNotEmpty) {
                      if (newPasswordController.text == confirmPasswordController.text) {
                        var response = await ApiAuthSevice.createNewPassword(
                            "/reset-password",
                            email,
                            widget.otp,
                            newPasswordController.text.toString(),
                            confirmPasswordController.text.toString());

                        if (response != null) {
                          _showPasswordChangedDialog(context);
                        }
                      } else {
                        CustomToast.show(message: "Confirm Password Not Matched", backgroundColor: Colors.red);
                      }
                    } else {
                      CustomToast.show(message: "Fields are Empty", backgroundColor: Colors.red);
                    }
                  },
                  text: AppStrings.reset.tr),
            ],
          ),
        ),
      ),
    );
  }

  void _showPasswordChangedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppPadding.p24.w, vertical: AppPadding.p28.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: AppSize.s83.h,
                  width: AppSize.s83.w,
                  child: Image.asset(AppAssets.tickSticker),
                ),
                SizedBox(height: AppSize.s40.h),
                Text(
                  AppStrings.passwordChanged.tr,
                  style: getBoldStyle(color: AppColors.textColor),
                ),
                SizedBox(height: AppSize.s20.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: AppPadding.p40.w),
                  child: Text(
                    AppStrings.passwordChangedSuccessMessage.tr,
                    style: getMediumStyle(color: AppColors.labelTextColor),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: AppSize.s40.h),
                CustomButton(
                  onPress: () {
                    Get.offAll(AppSignInScreen());
                    // Get.offAndToNamed(AppRoutes.appSignIn);
                  },
                  text: AppStrings.backToSignIn.tr,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
