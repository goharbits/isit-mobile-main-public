import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:isit_app/app/auth/forget_password_screen.dart';
import 'package:isit_app/app/auth/services/api_auth_service.dart';
import 'package:isit_app/common/custom_toast.dart';
import 'package:isit_app/modules/corporate/presentation/screens/company_bottom_navbar.dart';
import 'package:isit_app/modules/employee/presentation/screens/emp_bottom_navbar.dart';
import 'package:isit_app/modules/professional/presentation/screnns/pro_bottom_navbar.dart';
import 'package:isit_app/modules/user/presentation/screens/user_bottom_navbar.dart';

import '../../common/custom_button.dart';
import '../../common/custome_text_field.dart';
import '../../common/text_styles.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_sizes.dart';
import '../../constants/app_strings.dart';

class AppSignInScreen extends StatefulWidget {
  const AppSignInScreen({super.key});

  @override
  _AppSignInScreenState createState() => _AppSignInScreenState();
}

class _AppSignInScreenState extends State<AppSignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  GetStorage box = GetStorage();

  final List<String> items = ['Corporate', 'Professional', 'Employee', 'User'];
  String? selectedValue;
  bool isLoading = false;

  @override
  void initState() {
    // Set the status bar color
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.blue, // Set the status bar color here
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: AppSize.s24.h,
            right: AppSize.s24.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppSize.s20.h),
              //Sign In Text
              Text(
                AppStrings.signIn.tr,
                style: getBoldStyle(color: AppColors.textColor),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppSize.s20.h),
              CustomTextField(
                  labelText: AppStrings.email.tr,
                  hintText: AppStrings.email.tr,
                  controller: emailController),

              SizedBox(
                height: AppSize.s10.h,
              ),
              CustomTextField(
                labelText: AppStrings.password.tr,
                hintText: AppStrings.password.tr,
                isPasswordField: true,
                controller: passwordController,
              ),

              SizedBox(
                height: AppSize.s10.h,
              ),
              // Container(
              //   width: MediaQuery.sizeOf(context).width * 1,
              //   height: 50,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(AppSize.s22_5.r),
              //       border: Border.all(width: 1.w,color: AppColors.grey),
              //       boxShadow: [
              //         BoxShadow(
              //             color:AppColors.shadowColor.withOpacity(0.12),
              //             offset: Offset(0, 2.63.h),
              //             blurRadius: AppSize.s10.r,
              //             spreadRadius: 0
              //         )
              //       ]
              //   ),
              //   child: DropdownButtonHideUnderline(
              //     child: DropdownButton2<String>(
              //       isExpanded: true,
              //       hint: Text(
              //         'Select Type',
              //         style: TextStyle(
              //           fontSize: 14,
              //           color: Theme.of(context).hintColor,
              //         ),
              //       ),
              //       items: items
              //           .map((String item) => DropdownMenuItem<String>(
              //         value: item,
              //         child: Text(
              //           item,
              //           style: const TextStyle(
              //             fontSize: 14,
              //           ),
              //         ),
              //       ))
              //           .toList(),
              //       value: selectedValue,
              //       onChanged: (String? value) {
              //         setState(() {
              //           selectedValue = value;
              //         });
              //       },
              //       buttonStyleData: const ButtonStyleData(
              //         padding: EdgeInsets.symmetric(horizontal: 16),
              //         height: 40,
              //         width: 140,
              //       ),
              //       menuItemStyleData: const MenuItemStyleData(
              //         height: 40,
              //       ),
              //     ),
              //   ),
              // ),
              //
              // SizedBox(height: AppSize.s5.h,),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Forgot Password logic
                    Get.to(
                        () => AppForgetPasswordScreen(title: "Reset Password"));
                  },
                  child: Text(AppStrings.forgetPassword.tr,
                      style: getMediumStyle(color: AppColors.darkBlue)),
                ),
              ),
              SizedBox(height: AppSize.s16.h),

              CustomButton(
                  onPress: () async {
                    if (emailController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty) {
                      var response = await ApiAuthSevice.fetchLoginDetail(
                          "/login",
                          emailController.text.toString(),
                          passwordController.text.toString());
                      if (response!.status == true) {
                        setState(() {
                          selectedValue = response.data!.role!.name;

                          box.write("profileId", response.data!.id);
                          box.write("roleId", response.data!.roleId);
                          box.write("name", response.data!.name);
                          box.write("email", response.data!.email);
                          box.write("about", response.data!.about);
                          box.write("token", response.data!.token);
                          box.write("phoneNo", response.data!.phoneNo);

                          if (selectedValue == "corporate") {
                            box.write("einNo", response.data!.einNumber);
                            box.write("taxIdNo", response.data!.taxIdNumber);
                            box.write("registrationNo",
                                response.data!.registrationNumber);
                            box.write(
                                "workPermit", response.data!.workPermitId);
                          } else if (selectedValue == "professional") {
                            box.write("securityNo", response.data!.ssNumber);
                          } else if (selectedValue == "employee") {
                            box.write("securityNo", response.data!.ssNumber);
                            box.write("parentId", response.data!.parentId);
                          } else if (selectedValue == "user") {
                            box.write("securityNo", response.data!.ssNumber);
                          }
                          //isLoading = !isLoading;
                        });
                      }
                      if (selectedValue == "corporate") {
                        Get.to(() => CompanyBottomNavbar());
                        // Get.toNamed(AppRoutes.companyDashboardScreen);
                      } else if (selectedValue == "professional") {
                        Get.to(() => ProBottomNavbar());
                        //Get.toNamed(AppRoutes.proDashboardScreen);
                      } else if (selectedValue == "employee") {
                        Get.to(() => EmpBottomNavbar());
                        //Get.toNamed(AppRoutes.empDashboardScreen);
                      } else if (selectedValue == "user") {
                        Get.to(() => UserBottomNavbar());
                        // Get.toNamed(AppRoutes.userDashboardScreen);
                      }
                    } else {
                      CustomToast.show(
                          message: "Field are Empty",
                          backgroundColor: Colors.red);
                      // setState(() {
                      //   isLoading = !isLoading;
                      // });
                    }
                  },
                  isLoading: isLoading,
                  text: AppStrings.next.tr),
            ],
          ),
        ),
      ),
    );
  }
}
