import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DocumentManageFormController extends GetxController{

  final TextEditingController fullNameController=TextEditingController();
  RxBool isChecked = false.obs;
  RxBool isDocumentChecked = false.obs;
}