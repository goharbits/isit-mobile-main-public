import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UserDashboardController extends GetxController{

  final TextEditingController searchController=TextEditingController();

  var selectedIndex = 0.obs;

  RxString selectedMenuValue=''.obs;
  RxList<String> menuList = RxList<String>(['menu1','menu2','menu3']);

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
