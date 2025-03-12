import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:isit_app/modules/corporate/data/controller/corporate_emp_dtl_controller.dart';

import '../../../../../app/routes/app_routes.dart';
import '../../../../../common/custom_back_icon.dart';
import '../../../../../common/custome_text_field.dart';
import '../../../../../common/text_styles.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_fonts.dart';
import '../../../../../constants/app_sizes.dart';
import '../../../data/services/api_service_corporate.dart';

class CompanyEmployeeDetail extends StatefulWidget {
  int? employeeId;
  CompanyEmployeeDetail({super.key, required this.employeeId});

  @override
  State<CompanyEmployeeDetail> createState() => _CompanyEmployeeDetailState();
}

class _CompanyEmployeeDetailState extends State<CompanyEmployeeDetail> {
  final CorporateEmpDtlController employeeDocumentsViewModel =
      Get.put(CorporateEmpDtlController());

  GetStorage box = GetStorage();
  var profileId;

  fetchEmpDetail(profileId) async {
    var response = await ApiServiceCorporate.fetchEmployeeDetail("/corporate/$profileId/employee/${widget.employeeId}");
    if (response != null && response.status == true) {
      setState(() {
        employeeDocumentsViewModel.fullName.value = response.data!.name!;
        employeeDocumentsViewModel.securityNumber.value = response.data!.ssNumber!.toString();
        employeeDocumentsViewModel.email.value = response.data!.email!;
        employeeDocumentsViewModel.aboutYourself.value = response.data!.about!;
      });
    }
  }

  Widget _buildServiceContainer(String service) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      height: 30,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.grey),
      ),
      child: Text(
        service,
        style: TextStyle(color: Colors.grey.shade600),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profileId = box.read("profileId");
    fetchEmpDetail(profileId);
    employeeDocumentsViewModel.fetchServices(widget.employeeId!);
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
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Employee Details',
                      style: getBoldStyle(
                          color: AppColors.textColor,
                          fontSize: FontSize.s18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.editCompanyEmployeeDetail);
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: AppColors.darkBlue,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Icon(
                        Icons.edit,
                        color: AppColors.white,
                      ),
                    ),
                  )
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
                        SizedBox(height: AppSize.s20.h),
                        Align(
                          alignment: Alignment.center,
                          child: CircleAvatar(
                            backgroundColor: AppColors.grey,
                            minRadius: 50,
                            maxRadius: 50,
                            child: Icon(Icons.person),
                          ),
                        ),
                        SizedBox(height: AppSize.s10.h),
                        Align(
                            alignment: Alignment.center,
                            child: Text("Profile Picture")),
                        SizedBox(height: AppSize.s20.h),
                        CustomTextField(
                          readOnly: true,
                            labelText: 'Full Name',
                            hintText: employeeDocumentsViewModel.fullName.value),
                        SizedBox(height: AppSize.s15.h),
                        CustomTextField(
                            readOnly: true,
                            labelText: 'Social Security Number',
                            hintText: employeeDocumentsViewModel.securityNumber.value),
                        SizedBox(height: AppSize.s15.h),
                        CustomTextField(
                            readOnly: true,
                            labelText: 'Email Address',
                            hintText: employeeDocumentsViewModel.email.value),
                        SizedBox(height: AppSize.s15.h),
                        CustomTextField(
                            readOnly: true,
                            labelText: 'About Yourself',
                            hintText: employeeDocumentsViewModel.aboutYourself.value,
                            minLines: 5,
                            maxLines: 5),
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
                            children: employeeDocumentsViewModel.services
                                .map((service) => _buildServiceContainer(service.name.toString()))
                                .toList(),
                          ),
                        ),
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
    );
  }
}
