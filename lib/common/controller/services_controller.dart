import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:isit_app/common/services/api_service.dart';

class ServicesController extends GetxController {
  // List of all services to display in the dropdown
  RxList<String> allServices = <String>[].obs;

  final List<String> allPrices = [
    'USD',
    'PKR',
    'EUR'
  ];

  // List of selected services
  RxList<String> selectedServices = <String>[].obs;
  late RxString selectedPrice;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchServices();
  }

  // Fetch services from the API
  Future<void> fetchServices() async {
    const String baseUrl = ApiService.baseUrl;
    const String endpoint = "/service";
    final Uri url = Uri.parse("$baseUrl$endpoint");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);

        if (jsonResponse['status'] == true) {
          final List<dynamic> data = jsonResponse['data'];

          // Populate allServices
          allServices.value =
              data.map((service) => service['name'].toString()).toList();
          debugPrint("Services: ${allServices}");
          debugPrint("All Services: ${allServices.length}");
        } else {
          debugPrint("Error fetching services: ${jsonResponse['message']}");
        }
      } else {
        debugPrint("Failed to fetch services. Status code: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Error occurred while fetching services: $e");
    }
  }

  // Add service to selected list
  void addService(String service) {
    if (!selectedServices.contains(service)) {
      selectedServices.add(service);
    }
  }

  // Remove service from selected list
  void removeService(String service) {
    selectedServices.remove(service);
  }
}
