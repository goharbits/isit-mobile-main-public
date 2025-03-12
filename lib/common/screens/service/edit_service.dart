import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:isit_app/common/custom_toast.dart';
import 'package:isit_app/common/services/api_service.dart';

import '../../../../../../common/custom_back_icon.dart';
import '../../../../../../common/custom_validity_button.dart';
import '../../../../../../common/custome_text_field.dart';
import '../../../../../../common/text_styles.dart';
import '../../../../../../constants/app_colors.dart';
import '../../../../../../constants/app_fonts.dart';
import '../../../../../../constants/app_sizes.dart';
import '../../controller/services_controller.dart';

class EditService extends StatefulWidget {
  String serviceName, servicePrice, currency;
  int serviceId;

  EditService({super.key, required this.serviceName, required this.servicePrice, required this.currency, required this.serviceId});

  @override
  State<EditService> createState() => _EditServiceState();
}

class _EditServiceState extends State<EditService> {
  final ServicesController controller = Get.put(ServicesController());
  TextEditingController applicablePriceController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    applicablePriceController.text = widget.servicePrice;
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
                      'Edit Service',
                      style: getBoldStyle(
                          color: AppColors.textColor, fontSize: FontSize.s18),
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
                  height: Get.height-150,
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
                              widget.serviceName = value;
                            }
                          },
                        ),
                        const SizedBox(height: 20),
                        Text("Price for the service"),
                        const SizedBox(height: 10),
                        DropdownSearch<String>(
                          items: controller.allPrices,
                          selectedItem: widget.currency,
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
                            hintText: "Enter applicable price",
                            controller: applicablePriceController),
                        SizedBox(height: AppSize.s30.h),
                        CustomValidityButton(
                          onPress: () async {
                            var response = await ApiService.updateService("/service/${widget.serviceId}",
                            widget.serviceName, controller.selectedPrice.value,
                                applicablePriceController.text.toString());

                            if (response!.status == true) {
                              CustomToast.show(
                                  message: "Service Updated Successfully",
                                  backgroundColor: Colors.green);
                            }
                          },
                          text: 'Update',
                          width: MediaQuery.sizeOf(context).width * 1,
                        ),
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
