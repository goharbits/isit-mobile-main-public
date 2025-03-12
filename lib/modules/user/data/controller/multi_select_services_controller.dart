import 'package:get/get.dart';

class MultiSelectController extends GetxController {
  // List of all services
  final List<String> services = [
    'Plumber',
    'Car Painter',
    'Car Wash',
    'Car Detailing',
    'Electrician',
    'Cook'
  ];

  // Reactive list of selected services
  RxList<String> selectedServices = <String>[].obs;

  // Add or remove a service from the selected list
  void toggleService(String service) {
    if (selectedServices.contains(service)) {
      selectedServices.remove(service);
    } else {
      selectedServices.add(service);
    }
  }
}