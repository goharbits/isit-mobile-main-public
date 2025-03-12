import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:isit_app/app/auth/signin_screen.dart';
import 'package:isit_app/common/custom_button.dart';
import 'package:isit_app/common/services/api_service.dart';

import '../../controller/services_controller.dart';
import '../../custom_back_icon.dart';
import '../../custom_validity_button.dart';
import '../../custome_text_field.dart';
import '../../text_styles.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_fonts.dart';
import '../../../constants/app_sizes.dart';

class AddService extends StatefulWidget {
  const AddService({super.key, required userId, required corporateId});

  @override
  State<AddService> createState() => _AddServiceState();
}

class _AddServiceState extends State<AddService> {
  final ServicesController controller = Get.put(ServicesController());
  TextEditingController applicablePriceController = TextEditingController();

  var serviceName;
  var servicePrice;
  var currency;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    applicablePriceController.dispose();
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
                      'Add Service',
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
                   height: Get.height - 150,
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
                        Obx(
                          () => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            child: Column(
                              children:
                                  controller.selectedServices.map((service) {
                                return Card(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: ListTile(
                                    title: Text(service),
                                    trailing: IconButton(
                                      icon: Icon(Icons.delete_sweep,
                                          color: Colors.red),
                                      onPressed: () =>
                                          controller.removeService(service),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text("Price for the service"),
                        const SizedBox(height: 10),
                        DropdownSearch<String>(
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
                            hintText: "Enter applicable price",
                            controller: applicablePriceController),
                        SizedBox(height: AppSize.s30.h),
                        CustomButton(
                          onPress: () async {
                            var response = ApiService.saveService("/service", controller.selectedServices.toString(), currency,
                            applicablePriceController.text.toString());
                          },
                          text: 'Create',
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
