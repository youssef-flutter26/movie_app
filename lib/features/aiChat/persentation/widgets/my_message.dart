import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyMessage extends StatelessWidget {
  final String message;

  const MyMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 270.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
          bottomLeft: Radius.circular(16.r),
        ),
      ),
      child: Text(
        message,
        style: TextStyle(color: Colors.white, fontSize: 14.sp),
      ),
    );
  }
}
