import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../common/model/service_list_modl.dart';
import '../services/api_service_employee.dart';

class EmpMyProfileController extends GetxController {
  // Observables for the persistent state (main values)
  var fullName = ''.obs;
  var email = ''.obs;
  var securityNumber = ''.obs;
  var aboutEmployee = ''.obs;

  var services = <DataList>[].obs;

  // Temporary values for editing
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController socialSecurityController = TextEditingController();
  final TextEditingController aboutEmployeeController = TextEditingController();

  final GetStorage box = GetStorage();

  @override
  void onInit() {
    super.onInit();

    // Load persisted values into state
    fullName.value = box.read("name") ?? '';
    email.value = box.read("email") ?? '';
    securityNumber.value = box.read("securityNo").toString();
    aboutEmployee.value = box.read("about") ?? '';

    // Initialize controllers with the current state
    fullNameController.text = fullName.value;
    emailController.text = email.value;
    socialSecurityController.text = securityNumber.value;
    aboutEmployeeController.text = aboutEmployee.value;

    var empId = box.read("profileId");

    fetchServices(empId);
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

  // Method to save changes to the main state
  void saveChanges() {
    fullName.value = fullNameController.text;
    email.value = emailController.text;
    securityNumber.value = socialSecurityController.text;
    aboutEmployee.value = aboutEmployeeController.text;

    // Persist the updated values in GetStorage
    box.write("name", fullName.value);
    box.write("email", email.value);
    box.write("securityNo", securityNumber.value);
    box.write("about", aboutEmployee.value);
  }

  void resetControllers() {
    fullNameController.text = fullName.value;
    emailController.text = email.value;
    socialSecurityController.text = securityNumber.value;
    aboutEmployeeController.text = aboutEmployee.value;
  }

  @override
  void onClose() {
    // Dispose controllers to avoid memory leaks
    fullNameController.dispose();
    emailController.dispose();
    socialSecurityController.dispose();
    aboutEmployeeController.dispose();
    super.onClose();
  }
}
