import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CompanyMyProfileController extends GetxController {
  // Observables for the persistent state (main values)
  var companyName = ''.obs;
  var email = ''.obs;
  var location = ''.obs;
  var phoneNumber = ''.obs;
  var einNumber = ''.obs;
  var taxId = ''.obs;
  var registrationNo = ''.obs;
  var workPermit = ''.obs;
  var aboutCompany = ''.obs;

  // Temporary values for editing
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController einNumberController = TextEditingController();
  final TextEditingController taxIdController = TextEditingController();
  final TextEditingController registrationController = TextEditingController();
  final TextEditingController workPermitController = TextEditingController();
  final TextEditingController aboutCompanyController = TextEditingController();

  final GetStorage box = GetStorage();

  @override
  void onInit() {
    super.onInit();

    // Load persisted values into state
    companyName.value = box.read("name") ?? '';
    email.value = box.read("email") ?? '';
    location.value = box.read("location") ?? '';
    phoneNumber.value = box.read("phoneNo") ?? '';
    einNumber.value = box.read("einNo")?.toString() ?? '';
    taxId.value = box.read("taxIdNo") ?? '';
    registrationNo.value = box.read("registrationNo") ?? '';
    workPermit.value = box.read("workPermit") ?? '';
    aboutCompany.value = box.read("about") ?? '';

    // Initialize controllers with the current state
    companyNameController.text = companyName.value;
    emailController.text = email.value;
    locationController.text = location.value;
    phoneController.text = phoneNumber.value;
    einNumberController.text = einNumber.value;
    taxIdController.text = taxId.value;
    registrationController.text = registrationNo.value;
    workPermitController.text = workPermit.value;
    aboutCompanyController.text = aboutCompany.value;
  }

  // Method to save changes to the main state
  void saveChanges() {
    companyName.value = companyNameController.text;
    email.value = emailController.text;
    location.value = locationController.text;
    phoneNumber.value = phoneController.text;
    einNumber.value = einNumberController.text;
    taxId.value = taxIdController.text;
    registrationNo.value = registrationController.text;
    workPermit.value = workPermitController.text;
    aboutCompany.value = aboutCompanyController.text;

    // Persist the updated values in GetStorage
    box.write("name", companyName.value);
    box.write("email", email.value);
    box.write("location", location.value);
    box.write("phoneNo", phoneNumber.value);
    box.write("einNo", einNumber.value);
    box.write("taxIdNo", taxId.value);
    box.write("registrationNo", registrationNo.value);
    box.write("workPermit", workPermit.value);
    box.write("about", aboutCompany.value);
  }

  void resetControllers() {
    companyNameController.text = companyName.value;
    emailController.text = email.value;
    locationController.text = location.value;
    phoneController.text = phoneNumber.value;
    einNumberController.text = einNumber.value;
    taxIdController.text = taxId.value;
    registrationController.text = registrationNo.value;
    workPermitController.text = workPermit.value;
    aboutCompanyController.text = aboutCompany.value;
  }

  @override
  void onClose() {
    // Dispose controllers to avoid memory leaks
    companyNameController.dispose();
    emailController.dispose();
    locationController.dispose();
    phoneController.dispose();
    einNumberController.dispose();
    taxIdController.dispose();
    registrationController.dispose();
    workPermitController.dispose();
    aboutCompanyController.dispose();
    super.onClose();
  }
}
