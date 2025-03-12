import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:isit_app/common/screens/service/add_service.dart';
import 'package:isit_app/modules/employee/data/controller/emp_my_profile_controller.dart';
import 'package:isit_app/modules/employee/data/services/api_service_employee.dart';

import '../../../../../common/custom_back_icon.dart';
import '../../../../../common/custom_toast.dart';
import '../../../../../common/custom_validity_button.dart';
import '../../../../../common/custome_text_field.dart';
import '../../../../../common/screens/service/edit_service.dart';
import '../../../../../common/text_styles.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_fonts.dart';
import '../../../../../constants/app_sizes.dart';

class EmpEditMyProfile extends StatefulWidget {
  const EmpEditMyProfile({super.key});

  @override
  State<EmpEditMyProfile> createState() => _ProEditMyProfileState();
}

class _ProEditMyProfileState extends State<EmpEditMyProfile> {
  GetStorage box = GetStorage();
  final profileController = Get.find<EmpMyProfileController>();
  var profileId, phoneNo, parentId;

  Widget _buildServiceContainer(String service, int id, String currency,
      String price, int? corporateId) {
    return InkWell(
      onTap: () {
        Get.to(() => EditService(serviceName: service, servicePrice: price, currency: currency, serviceId: id));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        height: 30,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min, // Adjust width dynamically
          children: [
            Text(
              service,
              style: TextStyle(color: Colors.grey.shade600),
            ),
            SizedBox(width: 6),
            Icon(Icons.edit, color: Colors.black, size: 14),
          ],
        ),
      ),
    );
  }

  Widget _buildAddServiceContainer() {
    return InkWell(
      onTap: () {
        Get.to(AddService(userId: profileId, corporateId: parentId));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        height: 30,
        decoration: BoxDecoration(
            color: AppColors.darkBlue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: AppColors.darkBlue)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Add Service",
              style: TextStyle(color: AppColors.darkBlue),
            ),
            SizedBox(width: 6),
            Icon(
              Icons.add,
              color: AppColors.darkBlue,
              size: 14,
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profileId = box.read("profileId").toString();
    parentId = box.read("parentId").toString();
    phoneNo = box.read("phoneNo");
    profileController.resetControllers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSize.s24.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomBackIcon(),
                    Spacer(),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        '  Edit Profile',
                        style: getBoldStyle(
                            color: AppColors.textColor, fontSize: FontSize.s18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Spacer(flex: 2),
                  ],
                ),
              ),
              SizedBox(height: 45),
              Column(
                //clipBehavior: Clip.none,
                children: [
                  Container(
                    width: Get.width,
                    height: MediaQuery.sizeOf(context).height * 0.85,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(AppSize.s50.r),
                        topRight: Radius.circular(AppSize.s50.r),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: AppSize.s24.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: AppSize.s20.h),
                            CircleAvatar(
                              backgroundColor: AppColors.grey,
                              minRadius: 50,
                              maxRadius: 50,
                              child: Icon(Icons.person),
                            ),
                            SizedBox(height: AppSize.s20.h),
                            CustomTextField(
                                labelText: 'Full Name',
                                hintText: 'Full Name',
                                controller:
                                    profileController.fullNameController),
                            SizedBox(height: AppSize.s15.h),
                            CustomTextField(
                                labelText: 'Email',
                                hintText: 'Email',
                                controller: profileController.emailController),
                            SizedBox(height: AppSize.s15.h),
                            CustomTextField(
                                labelText: 'Social Security Number',
                                hintText: 'Social Security Number',
                                controller:
                                    profileController.socialSecurityController),
                            SizedBox(height: AppSize.s15.h),
                            CustomTextField(
                                labelText: 'About Employee',
                                hintText: 'About Employee',
                                minLines: 3,
                                maxLines: 3,
                                controller:
                                    profileController.aboutEmployeeController),
                            SizedBox(height: AppSize.s15.h),
                            Text("Services"),
                            SizedBox(height: AppSize.s10.h),
                            Obx(
                              () => Wrap(
                                spacing: 8.0,
                                runSpacing: 8.0,
                                children: [
                                  // Generate service containers dynamically
                                  ...profileController.services.map((service) =>
                                      _buildServiceContainer(
                                          service.name.toString(),
                                          service.id!,
                                          service.currency!,
                                          service.price!,
                                          service.corporateId)),
                                  // Add the special container after services
                                  _buildAddServiceContainer(),
                                ],
                              ),
                            ),
                            SizedBox(height: AppSize.s30.h),
                            CustomValidityButton(
                              onPress: () async {
                                var response =
                                    await ApiServiceEmployee.updateProfile(
                                        "/employee/profile/${profileId}",
                                        profileController
                                            .fullNameController.text,
                                        profileController.emailController.text,
                                        profileController
                                            .socialSecurityController.text,
                                        profileController
                                            .aboutEmployeeController.text,
                                        phoneNo);

                                if (response!.status == true) {
                                  profileController.saveChanges();
                                  Get.back();
                                  CustomToast.show(
                                      message: "Profile Updated Successfully",
                                      backgroundColor: Colors.green);
                                }
                              },
                              text: "Save",
                              width: MediaQuery.sizeOf(context).width * 1,
                            ),
                            SizedBox(
                              height: AppSize.s136,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
