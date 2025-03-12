import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isit_app/app/auth/create_new_password_screen.dart';
import 'package:isit_app/app/auth/services/api_auth_service.dart';
import 'package:isit_app/constants/app_colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../common/custom_back_icon.dart';
import '../../common/custom_button.dart';
import '../../common/custom_toast.dart';

class OtpVerificationScreen extends StatefulWidget {
  String email;
  OtpVerificationScreen({super.key, required this.email});

  @override
  _OtpVerificationScreenState createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  TextEditingController otpController = TextEditingController();

  String currentText = "";
  late String email;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    email = widget.email;
  }

  @override
  void dispose() {
    otpController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomBackIcon(),
              SizedBox(height: 20),
              Text(
                "Verification OTP",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                "Enter the verification OTP that we have sent to your email",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32.0),
              PinCodeTextField(
                appContext: context,
                length: 4,
                controller: otpController,
                focusNode: _focusNode,
                obscureText: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(12),
                  fieldHeight: 50,
                  fieldWidth: 50,
                  activeFillColor: Colors.white,
                  inactiveFillColor: Colors.white,
                  selectedFillColor: Colors.white,
                  activeColor: Color(0xFFE2E8F0),
                  inactiveColor: Color(0xFFE2E8F0),
                  selectedColor: AppColors.darkBlue,
                ),
                onChanged: (value) {
                  setState(() {
                    currentText = value;
                  });
                },
                onCompleted: (value) {
                  debugPrint("OTP entered: $value");
                },
              ),
              SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                  // Add Resend OTP functionality here
                  debugPrint("Resend OTP pressed");
                },
                child: Text(
                  "Resend OTP",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16.0,
                  ),
                ),
              ),
              SizedBox(height: 32.0),
              CustomButton(onPress: () async {
                debugPrint('OTP entered: $currentText');

                if (otpController.text.isNotEmpty && currentText.length == 4) {
                  var response = await ApiAuthSevice.verifyOtp(
                      "/verify-otp", email, otpController.text.toString());
                  if (response != null) {
                    Get.to(AppCreateNewPasswordScreen(email: email, otp: otpController.text));
                  }
                } else {
                  CustomToast.show(message: "Invalid OTP Length", backgroundColor: Colors.red);
                }
              },
                  text: "Continue")
            ],
          ),
        ),
      ),
    );
  }
}
