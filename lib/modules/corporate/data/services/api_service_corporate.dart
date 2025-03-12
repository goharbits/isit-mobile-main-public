import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:isit_app/modules/corporate/data/models/corporate_add_emp_model.dart';
import 'package:isit_app/modules/corporate/data/models/corporate_emp_dtl_model.dart';
import 'package:isit_app/modules/corporate/data/models/corporate_emp_list_model.dart';
import 'package:isit_app/modules/corporate/data/models/corporate_update_pofile_model.dart';

import '../../../../constants/Api_base_url.dart';
import 'package:http/http.dart' as http;

class ApiServiceCorporate {
  static const baseUrl = ApiBaseUrl.baseUrl;

  static Future<CorporateUpdateProfileModel?> updateProfile(
      String endpoint,
      String name,
      phoneNumber,
      email,
      about,
      einNo,
      taxId,
      registrationNo,
      workPermit) async {
    Map<String, String> requestBody = {
      "name": "$name",
      "phone_no": "$phoneNumber",
      "email": "$email",
      "about": "$about",
      "ein_number": "$einNo",
      "tax_id_number": "$taxId",
      "registration_number": "$registrationNo",
      "work_permit_id": "$workPermit",
    };
    try {
      final response = await http.post(
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

        return CorporateUpdateProfileModel.fromJson(responseData);
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

  static Future<List<DataEmpList>?> fetchEmployees(String endpoint) async {
    try {
      final response = await http.get(
        Uri.parse("$baseUrl$endpoint"),
        headers: {
          'Content-Type': 'application/json'
          // 'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        // Decode the response body
        final Map<String, dynamic> responseData = json.decode(response.body);
        debugPrint('Data fetched successfully: $responseData');
        return CorporateEmpListModel.fromJson(responseData).data ?? [];
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

  static Future<CorporateEmpDtlModel?> fetchEmployeeDetail(
      String endpoint) async {
    try {
      final response = await http.get(
        Uri.parse("$baseUrl$endpoint"),
        headers: {
          'Content-Type': 'application/json'
          // 'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        // Decode the response body
        final Map<String, dynamic> responseData = json.decode(response.body);
        debugPrint('Data fetched successfully: $responseData');
        return CorporateEmpDtlModel.fromJson(responseData);
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

  static Future<CorporateAddEmpModel?> createEmployee(
      String endpoint,
      String name,
      String email,
      String password,
      String cPassword,
      String about,
      String ssNumber,
      String address,
      String latitude,
      String longitude,
      String phoneNo,
      [File? profile,
      other]) async {
    try {
      // Create a multipart request
      final uri = Uri.parse("$baseUrl$endpoint");
      final request = http.MultipartRequest('POST', uri);

      // Add text fields
      request.fields['name'] = name;
      request.fields['email'] = email;
      request.fields['password'] = password;
      request.fields['confirm_password'] = cPassword;
      request.fields['about'] = about;
      request.fields['ss_number'] = ssNumber;
      request.fields['address'] = address;
      request.fields['latitude'] = latitude;
      request.fields['longitude'] = longitude;
      request.fields['phone_no'] = phoneNo;

      // Add the file if it's provided
      if (profile != null) {
        request.files.add(await http.MultipartFile.fromPath(
          'profile', // Parameter name expected by the API
          profile.path,
        ));
      }
      if (other != null) {
        request.files.add(await http.MultipartFile.fromPath(
          'other', // Parameter name expected by the API
          other.path,
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
        final Map<String, dynamic> responseData =
            json.decode(responseBody.body);
        debugPrint('Data Saved Successfully');
        return CorporateAddEmpModel.fromJson(responseData);
      } else {
        debugPrint(
            'Failed to update profile. Status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      debugPrint('An error occurred: $e');
      return null;
    }
  }
}
