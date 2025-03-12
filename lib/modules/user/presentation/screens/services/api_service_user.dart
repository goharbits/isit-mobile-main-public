import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:flutter/material.dart';

import '../../../../../app/auth/model/app_update_profile_model.dart';
import '../../../../../constants/Api_base_url.dart';

class ApiServiceUser {
  static const baseUrl = ApiBaseUrl.baseUrl;

  static Future<AppUpdateProfileModel?> updateProfile(
      String endpoint, String name, String email, String ssNo, String about, [File? profile]) async {
    try {
      // Create a multipart request
      final uri = Uri.parse("$baseUrl$endpoint");
      final request = http.MultipartRequest('POST', uri);

      // Add text fields
      request.fields['name'] = name;
      request.fields['email'] = email;
      request.fields['ss_number'] = ssNo;
      request.fields['about'] = about;

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
}
