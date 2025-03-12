import 'package:flutter/material.dart';
import 'package:isit_app/common/text_styles.dart';

import '../constants/app_colors.dart';

class CustomDrawerListtile extends StatefulWidget {

  final IconData icon;
  final String text;
  final VoidCallback onPress;

  const CustomDrawerListtile({super.key,
    required this.icon,
    required this.text,
    required this.onPress,

  });

  @override
  State<CustomDrawerListtile> createState() => _CustomDrawerListtileState();
}

class _CustomDrawerListtileState extends State<CustomDrawerListtile> {
  Color? iconColor = AppColors.white;

  Color? textColor = AppColors.white;

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      leading: Icon(widget.icon, color: AppColors.white),
      title: Text(widget.text, style: getMediumStyle(color: AppColors.white)),
      onTap: widget.onPress,
    );
  }
}
