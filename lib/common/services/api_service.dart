import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:isit_app/common/model/update_service_model.dart';

import '../../constants/Api_base_url.dart';

class ApiService {
  static const baseUrl = ApiBaseUrl.baseUrl;

  static Future<UpdateServiceModel?> updateService(
      String endpoint, String serviceName, String currency, String price) async {
    Map<String, String> requestBody = {
      "name": "$serviceName",
      "currency": "$currency",
      "price": "$price"
    };
    try {
      final response = await http.put(
        Uri.parse("$baseUrl$endpoint"),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(requestBody),
      );
      if (response.statusCode == 200) {
        // Decode the response body
        final Map<String, dynamic> responseData = json.decode(response.body);
        debugPrint('Data Saved Successfully');

        return UpdateServiceModel.fromJson(responseData);
      } else {
        // Handle error response
        debugPrint('Failed to load data. Status code: ${response.statusCode}');

        return null;
      }
    } catch (e) {
      debugPrint('An error occurred: $e');
      return null;
    }
  }

  static Future<UpdateServiceModel?> saveService(
      String endpoint, String serviceName, String currency, String price) async {
    Map<String, String> requestBody = {
      "name": "$serviceName",
      "currency": "$currency",
      "price": "$price",
      "user_id": "",
      "corporate_id": ""
    };
    try {
      final response = await http.put(
        Uri.parse("$baseUrl$endpoint"),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(requestBody),
      );
      if (response.statusCode == 200) {
        // Decode the response body
        final Map<String, dynamic> responseData = json.decode(response.body);
        debugPrint('Data Saved Successfully');

        return UpdateServiceModel.fromJson(responseData);
      } else {
        // Handle error response
        debugPrint('Failed to load data. Status code: ${response.statusCode}');

        return null;
      }
    } catch (e) {
      debugPrint('An error occurred: $e');
      return null;
    }
  }
}