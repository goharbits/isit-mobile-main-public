import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:isit_app/common/model/service_list_modl.dart';
import '../../../../app/auth/model/app_update_profile_model.dart';
import '../../../../constants/Api_base_url.dart';

class ApiServiceEmployee {
  static const baseUrl = ApiBaseUrl.baseUrl;

  static Future<AppUpdateProfileModel?> updateProfile(
      String endpoint, String name, String email, String ssNo, String about, String phone, [File? profile]) async {
    try {
      // Create a multipart request
      final uri = Uri.parse("$baseUrl$endpoint");
      final request = http.MultipartRequest('POST', uri);

      // Add text fields
      request.fields['name'] = name;
      request.fields['email'] = email;
      request.fields['ss_number'] = ssNo;
      request.fields['about'] = about;
      request.fields['phone_no'] = phone;

      // Add the file if it's provided
      if (profile != null) {
        request.files.add(await http.MultipartFile.fromPath(
          'profile', // Parameter name expected by the API
          profile.path,
        ));
      }

      // Add headers if required
      request.headers.addAll({
        'Accept': 'application/json',
      });

      // Send the request
      final response = await request.send();

      // Parse the response
      if (response.statusCode == 200) {
        final responseBody = await Response.fromStream(response);
        final Map<String, dynamic> responseData = json.decode(responseBody.body);
        debugPrint('Data Saved Successfully');
        return AppUpdateProfileModel.fromJson(responseData);
      } else {
        debugPrint('Failed to update profile. Status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      debugPrint('An error occurred: $e');
      return null;
    }
  }

  static Future<ServiceListModel?> fetchEmployeeService(
      String endpoint, int empId) async {
    debugPrint('Employee Id: $empId');

    try {
      final response = await http.get(
        Uri.parse("$baseUrl$endpoint$empId"),
        headers: {
          'Content-Type': 'application/json'
          // 'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        // Decode the response body
        final Map<String, dynamic> responseData = json.decode(response.body);
        debugPrint('Data fetched successfully: $responseData');
        return ServiceListModel.fromJson(responseData);
      } else {
        // Handle error response
        debugPrint('Failed to load data. Status code: ${response.statusCode}');
        debugPrint('Response body: ${response.body}');
        return null;
      }
    } catch (e) {
      debugPrint('An error occurred: $e');
      return null;
    }
  }

}
