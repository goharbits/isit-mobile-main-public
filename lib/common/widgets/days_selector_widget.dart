import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isit_app/common/controller/week_days_time_controller.dart';
import 'package:isit_app/constants/app_colors.dart';
import 'package:provider/provider.dart';

class DaySelectorWidget extends StatelessWidget {
  const DaySelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final weekDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    final provider = Provider.of<WeekDaySelectionProvider>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: weekDays.map((day) {
        final isSelected = provider.isSelected(day);
        return GestureDetector(
          onTap: () => provider.toggleSelection(day),
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.darkBlue : Colors.white,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              day,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
