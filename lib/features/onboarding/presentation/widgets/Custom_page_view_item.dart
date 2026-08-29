import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPageViewItem extends StatelessWidget {
  const CustomPageViewItem({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  final String image;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.5,
      child: Stack(
        children: [
          // 1. الصورة (تأكد أن الصورة المصدرة تحتوي على الدوائر والخلفية كاملة PNG شفافة)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(image, fit: BoxFit.contain),
          ),

          // 2. النصوص في الأسفل
          Positioned(
            top: MediaQuery.of(context).size.height * 0.55,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
