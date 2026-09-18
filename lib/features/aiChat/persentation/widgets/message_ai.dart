import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageAi extends StatelessWidget {
  final String message;

  const MessageAi({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 16.r,
          child: Icon(Icons.smart_toy_outlined, size: 18.sp),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'AI Chat',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 4.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16.r),
                    bottomLeft: Radius.circular(16.r),
                    bottomRight: Radius.circular(16.r),
                  ),
                ),
                child: Text(message, style: TextStyle(fontSize: 14.sp)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
