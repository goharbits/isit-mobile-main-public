import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDrawerController extends GetxController {
  // You can add more state variables here if needed
  void openDrawer(GlobalKey<ScaffoldState> scaffoldKey) {
    scaffoldKey.currentState!.openDrawer();
  }
}
