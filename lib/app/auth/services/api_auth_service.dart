import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:isit_app/constants/Api_base_url.dart';

import '../../../common/custom_toast.dart';
import '../model/app_login_model.dart';


class ApiAuthSevice {
  static const baseUrl = ApiBaseUrl.baseUrl;

  static Future<AppLoginModel?> fetchLoginDetail(
      String endpoint, String email, String password) async {
    Map<String, String> requestBody = {
      "email": "$email",
      "password": "$password"
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

        return AppLoginModel.fromJson(responseData);
      } else {
        // Handle error response
        debugPrint('Failed to load data. Status code: ${response.statusCode}');
        CustomToast.show(message: "Invalid Email or Password", backgroundColor: Colors.red);
        return null;
      }
    } catch (e) {
      debugPrint('An error occurred: $e');
      return null;
    }
  }

  static Future<dynamic> forgetPassword(
      String endpoint, String email) async {
    Map<String, String> requestBody = {
      "email": "$email"
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

        return response.statusCode;
      } else {
        // Handle error response
        debugPrint('Failed to load data. Status code: ${response.statusCode}');
        CustomToast.show(message: "Invalid Email", backgroundColor: Colors.red);
        return null;
      }
    } catch (e) {
      debugPrint('An error occurred: $e');
      return null;
    }
  }

  static Future<dynamic> verifyOtp(
      String endpoint, String email, String otp) async {
    Map<String, String> requestBody = {
      "email": "$email",
      "otp": otp
    };
    debugPrint("Data Values: $email , $otp");
    try {
      final response = await http.post(
        Uri.parse("$baseUrl$endpoint"),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(requestBody),
      );
      if (response.statusCode == 200) {
        debugPrint("Response Code: ${response.statusCode}");
        // Decode the response body
        final Map<String, dynamic> responseData = json.decode(response.body);
        debugPrint('Data Saved Successfully');

        return response.statusCode;
      } else {
        // Handle error response
        debugPrint('Failed to load data. Status code: ${response.statusCode}');
        debugPrint('FResponse Data: ${response.body}');
        CustomToast.show(message: "Invalid OTP", backgroundColor: Colors.red);
        return null;
      }
    } catch (e) {
      debugPrint('An error occurred: $e');
      return null;
    }
  }

  static Future<dynamic> createNewPassword(
      String endpoint, String email, String otp, String password, String cPassword) async {
    Map<String, String> requestBody = {
      "email": "$email",
      "otp": "$otp",
      "password": "$password",
      "confirm_password": "$cPassword"
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

        return response.statusCode;
      } else {
        // Handle error response
        debugPrint('Failed to load data. Status code: ${response.statusCode}');
        debugPrint('Response body: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      debugPrint('An error occurred: $e');
      return null;
    }
  }
}
