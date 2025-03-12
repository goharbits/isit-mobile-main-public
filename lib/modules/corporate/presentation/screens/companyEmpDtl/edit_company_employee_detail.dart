import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:isit_app/modules/corporate/data/controller/corporate_emp_dtl_controller.dart';

import '../../../../../app/routes/app_routes.dart';
import '../../../../../common/custom_back_icon.dart';
import '../../../../../common/custom_doc_select_button.dart';
import '../../../../../common/custom_validity_button.dart';
import '../../../../../common/custome_text_field.dart';
import '../../../../../common/screens/service/edit_service.dart';
import '../../../../../common/text_styles.dart';
import '../../../../../constants/app_assets.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_fonts.dart';
import '../../../../../constants/app_sizes.dart';

class EditCompanyEmployeeDetail extends StatefulWidget {

  const EditCompanyEmployeeDetail({super.key});

  @override
  State<EditCompanyEmployeeDetail> createState() => _EditCompanyEmployeeDetailState();
}

class _EditCompanyEmployeeDetailState extends State<EditCompanyEmployeeDetail> {

  final employeeDocumentsViewModel = Get.find<CorporateEmpDtlController>();

  Widget _buildBottomSheetContent() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      width: 375.w,
      height: 350.h, // Height of the bottom sheet
      decoration: BoxDecoration(
        color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
            topLeft: Radius.circular(50),
          ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: AppSize.s5.h,
          ),
          Align(
              alignment: Alignment.center,
              child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Image.asset(
                    AppAssets.divider,
                    width: AppSize.s70_88.w,
                    height: AppSize.s6,
                  ))),
          SizedBox(
            height: AppSize.s27.h,
          ),
          Text(
            'Add Medical Record',
            style: getBoldStyle(
                color: AppColors.textColor, fontSize: FontSize.s18),
          ),
          SizedBox(height: AppSize.s10.w),
          CustomDocumentSelectButton(
            icon: Icons.camera_alt_rounded,
            text: 'Open Camera',
            onPress: () {
              Get.toNamed(AppRoutes.companyDashboardScreen);
            },
          ),
          SizedBox(height: AppSize.s10.w),
          CustomDocumentSelectButton(
            icon: Icons.image,
            text: 'Select From Gallery',
            onPress: () {},
          ),
          SizedBox(height: AppSize.s10.w),
          CustomDocumentSelectButton(
            icon: Icons.description,
            text: 'Documents',
            onPress: () {},
          ),
        ],
      ),
    );
  }

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
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 10, vertical: 5),
      height: 30,
      decoration: BoxDecoration(
          color: AppColors.darkBlue.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12.0),
          border:
          Border.all(color: AppColors.darkBlue)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Add Service",
            style: TextStyle(color: AppColors.darkBlue),
          ),
          SizedBox(width: 6),
          Icon(Icons.add, color: AppColors.darkBlue, size: 14,)
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    employeeDocumentsViewModel.resetControllers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: AppSize.s60.h,
            ),
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
                      'Edit EmployeeName',
                      style: getBoldStyle(
                          color: AppColors.textColor,
                          fontSize: FontSize.s18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Spacer()
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
                  // height: Get.height,
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
                        SizedBox(height: AppSize.s15.h),
                        CustomTextField(
                            labelText: 'Social Security Number',
                            hintText: 'Social Security Number',
                            controller:
                            employeeDocumentsViewModel.securityNumberController),
                        SizedBox(height: AppSize.s15.h),
                        CustomTextField(
                            labelText: 'Email Address',
                            hintText: 'Email Address',
                            controller:
                            employeeDocumentsViewModel.emailController),
                        SizedBox(height: AppSize.s15.h),
                        CustomTextField(
                            labelText: 'About Yourself',
                            hintText: 'About Yourself',
                            minLines: 5,
                            maxLines: 5,
                            controller: employeeDocumentsViewModel
                                .aboutYourselfController),
                        SizedBox(height: AppSize.s15.h),
                        Text(
                          "Services",
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(height: AppSize.s10.h),
                        Obx(
                              () => Wrap(
                            spacing: 8.0,
                            runSpacing: 8.0,
                            children: [
                              // Generate service containers dynamically
                              ...employeeDocumentsViewModel.services.map((service) =>
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
                        SizedBox(height: AppSize.s20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Profile Picture"),
                            Text("Attached Document"),
                          ],
                        ),
                        SizedBox(height: AppSize.s10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20),
                                    ),
                                  ),
                                  backgroundColor: Colors.white,
                                  builder: (BuildContext context) {
                                    return _buildBottomSheetContent();
                                  },
                                );
                              },
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20.0),
                                  border: Border.all(color: Colors.grey),
                                  boxShadow: [BoxShadow(
                                    color: Colors.grey.shade400,
                                    spreadRadius: 1,
                                    blurRadius: 4
                                  )]
                                ),
                                child: Center(child: Text("   Upload Picture   ",
                                style: TextStyle(color: AppColors.darkBlue),)),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20),
                                    ),
                                  ),
                                  backgroundColor: Colors.white,
                                  builder: (BuildContext context) {
                                    return _buildBottomSheetContent();
                                  },
                                );
                              },
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.0),
                                    border: Border.all(color: Colors.grey),
                                    boxShadow: [BoxShadow(
                                        color: Colors.grey.shade400,
                                        spreadRadius: 1,
                                        blurRadius: 4
                                    )]
                                ),
                                child: Center(child: Text("   Upload Document   ",
                                  style: TextStyle(color: AppColors.darkBlue),)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: AppSize.s30.h),
                        CustomValidityButton(
                            onPress: () {},
                            text: 'Update', width: MediaQuery.sizeOf(context).width * 1,),
                        SizedBox(
                          height: AppSize.s100,
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
    );
  }
}
