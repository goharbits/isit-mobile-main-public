import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProDashboardController extends GetxController{

  final TextEditingController searchController = TextEditingController();

  var selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}