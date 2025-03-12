import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:isit_app/modules/corporate/data/services/api_service_corporate.dart';

import '../../../../common/model/service_list_modl.dart';
import '../../../employee/data/services/api_service_employee.dart';

class CorporateEmpDtlController extends GetxController{

  RxBool isChecked = false.obs;
  RxBool isDocumentChecked = false.obs;

  var fullName = 'Full Name'.obs;
  var securityNumber = 'Social Security Number'.obs;
  var email = 'Email Address'.obs;
  var aboutYourself = 'About Yourself'.obs;

  var services = <DataList>[].obs;

  GetStorage box = GetStorage();

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController securityNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController aboutYourselfController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> fetchServices(int empId) async {
    try {
      // Fetch the data using your ApiServiceEmployee
      final serviceList = await ApiServiceEmployee.fetchEmployeeService('/service/user/', empId);

      // Check if the response data is valid
      if (serviceList != null && serviceList.data != null) {
        // Extract the service names, filter nulls, and update the observable list
        services.assignAll(serviceList.data!);
      } else {
        print("No services found.");
      }
    } catch (error) {
      print("Error fetching services: $error");
    }
  }

  void saveChanges() {
    fullName.value = fullNameController.text;
    email.value = emailController.text;
    securityNumber.value = securityNumberController.text;
    aboutYourself.value = aboutYourselfController.text;
  }

  void resetControllers() {
    fullNameController.text = fullName.value;
    securityNumberController.text = securityNumber.value;
    emailController.text = email.value;
    aboutYourselfController.text = aboutYourself.value;
  }
}