import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../common/custom_back_icon.dart';
import '../../../../../../common/custome_text_field.dart';
import '../../../../../../common/text_styles.dart';
import '../../../../../../constants/app_colors.dart';
import '../../../../../../constants/app_fonts.dart';
import '../../../../../../constants/app_sizes.dart';
import '../../../../common/controller/services_controller.dart';
import '../../../../common/screens/service/edit_service.dart';

class EmpServiceDetail extends StatefulWidget {
  String serviceName;

  EmpServiceDetail({super.key, required this.serviceName});

  @override
  State<EmpServiceDetail> createState() => _EmpServiceDetailState();
}

class _EmpServiceDetailState extends State<EmpServiceDetail> {
  final ServicesController controller = Get.put(ServicesController());
  TextEditingController applicablePriceController = TextEditingController();

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
                      'Service Details',
                      style: getBoldStyle(
                          color: AppColors.textColor, fontSize: FontSize.s18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(()=> EditService(serviceName: widget.serviceName, servicePrice: '', currency: '', serviceId: 1,));
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
                    padding: EdgeInsets.symmetric(horizontal: AppSize.s24.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: AppSize.s15.h),
                        Text("Professional Details"),
                        SizedBox(height: AppSize.s15.h),
                        Text("Employee Offer services"),
                        SizedBox(height: AppSize.s10.h),
                        DropdownSearch<String>(
                          enabled: false,
                          items: controller.allServices,
                          selectedItem: widget.serviceName,
                          dropdownDecoratorProps: DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                              suffixIcon: Icon(Icons.add),
                              hintText: "Search a service",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ),
                          popupProps: PopupProps.menu(
                            showSearchBox: true,
                            searchFieldProps: TextFieldProps(
                              decoration: InputDecoration(
                                labelText: 'Search a service',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          onChanged: (value) {
                            if (value != null) {
                              controller.addService(value);
                            }
                          },
                        ),
                        const SizedBox(height: 20),
                        Text("Price for the service"),
                        const SizedBox(height: 10),
                        DropdownSearch<String>(
                          enabled: false,
                          selectedItem: "USD",
                          items: controller.allPrices,
                          dropdownDecoratorProps: DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                              hintText: "Search Price",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ),
                          popupProps: PopupProps.menu(
                            showSearchBox: true,
                            searchFieldProps: TextFieldProps(
                              decoration: InputDecoration(
                                labelText: 'Select Price',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          onChanged: (value) {
                            if (value != null) {
                              controller.selectedPrice.value = value;
                            }
                          },
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                            labelText: "Price applicable for (per hour)",
                            hintText: "50\$",
                            controller: applicablePriceController),
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
