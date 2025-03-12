import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{

  final TextEditingController emailController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();


  final TextEditingController fullNameController=TextEditingController();
  final TextEditingController phoneController=TextEditingController();

  final TextEditingController newPasswordController=TextEditingController();
  final TextEditingController confirmPasswordController=TextEditingController();


  // RxString selectedCategoryValue=''.obs;
  // RxList<String> categoryList = RxList<String>(['category1','category2','category3']);
  //
  // RxString selectedCompanyValue=''.obs;
  // RxList<String> CompanyList = RxList<String>(['company1','company2','company3']);


  var isPasswordObscured = true.obs;
  // Toggle password visibility
  void togglePasswordVisibility() {
    isPasswordObscured.value = !isPasswordObscured.value;
  }


  //RxBool isChecked = false.obs;

  var selectedCheckbox = 0.obs; // 0: None, 1: First, 2: Second

  // void toggleCheckbox(int checkboxNumber) {
  //   if (selectedCheckbox.value == checkboxNumber) {
  //     selectedCheckbox.value = 0; // Deselect if already selected
  //   } else {
  //     selectedCheckbox.value = checkboxNumber; // Select this checkbox
  //   }
  // }

}