import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildSocialIcon({
  required Color color,
  required IconData icon,
  Color iconColor = Colors.white,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: CircleAvatar(
      radius: 20.r,
      backgroundColor: color,
      child: Icon(icon, color: iconColor, size: 22.sp),
    ),
  );
}
