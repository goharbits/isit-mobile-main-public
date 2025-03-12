import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_colors.dart';

class CheckBoxWithLabel extends StatelessWidget {
  final RxBool isChecked;
  final String text;
  final ValueChanged<bool?> onChanged; // Callback for checkbox changes

  const CheckBoxWithLabel({
    super.key,
    required this.isChecked,
    required this.onChanged,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding: EdgeInsets.only(right: 40.0),
        child: Row(
          children: [
            Checkbox(
              value: isChecked.value,
              activeColor: AppColors.darkBlue,
              onChanged: (bool? value) {
                onChanged(value);
              },
            ),
            Expanded(
                child: Text(text.tr)
            ),
          ],
        ),
      );
    });
  }
}

//
// RichText(
// text: TextSpan(
// children: [
// TextSpan(
// text: 'By logging in, you agree to our ',
// style: getMediumStyle(color: ColorManager.textColor, fontSize: FontSize.s15),
// ),
// TextSpan(
// text: 'Terms and Conditions',
// style: getSemiBoldStyle(color: ColorManager.darkBlue, fontSize: FontSize.s15).copyWith(
// decoration: TextDecoration.underline,
// ),
// ),
// ],
// ),
// ),