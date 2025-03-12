import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchListController extends GetxController{

  final TextEditingController searchController=TextEditingController();

  var selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}