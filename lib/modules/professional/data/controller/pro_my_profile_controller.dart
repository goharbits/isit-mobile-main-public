import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProMyProfileController extends GetxController {
  // Observables for the persistent state (main values)
  var fullName = ''.obs;
  var email = ''.obs;
  var securityNumber = ''.obs;
  var aboutYourself = ''.obs;

  // Temporary values for editing
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController socialSecurityController = TextEditingController();
  final TextEditingController aboutYourselfController = TextEditingController();

  final GetStorage box = GetStorage();

  @override
  void onInit() {
    super.onInit();

    // Load persisted values into state
    fullName.value = box.read("name") ?? '';
    email.value = box.read("email") ?? '';
    securityNumber.value = box.read("securityNo").toString();
    aboutYourself.value = box.read("about") ?? '';

    // Initialize controllers with the current state
    fullNameController.text = fullName.value;
    emailController.text = email.value;
    socialSecurityController.text = securityNumber.value;
    aboutYourselfController.text = aboutYourself.value;
  }

  // Method to save changes to the main state
  void saveChanges() {
    fullName.value = fullNameController.text;
    email.value = emailController.text;
    securityNumber.value = socialSecurityController.text;
    aboutYourself.value = aboutYourselfController.text;

    // Persist the updated values in GetStorage
    box.write("name", fullName.value);
    box.write("email", email.value);
    box.write("securityNo", securityNumber.value);
    box.write("about", aboutYourself.value);
  }

  void resetControllers() {
    fullNameController.text = fullName.value;
    emailController.text = email.value;
    socialSecurityController.text = securityNumber.value;
    aboutYourselfController.text = aboutYourself.value;
  }

  @override
  void onClose() {
    // Dispose controllers to avoid memory leaks
    fullNameController.dispose();
    emailController.dispose();
    socialSecurityController.dispose();
    aboutYourselfController.dispose();
    super.onClose();
  }
}
