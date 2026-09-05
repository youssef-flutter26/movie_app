import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onFilterPressed;

  const SearchTextField({
    super.key,
    this.controller,
    this.onChanged,
    this.onFilterPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.h,
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      decoration: BoxDecoration(
        color: const Color(0xFF252836),
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: TextStyle(color: Colors.white, fontSize: 14.sp),
        cursorColor: Colors.blue,
        decoration: InputDecoration(
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: 'Search a title..',
          hintStyle: TextStyle(
            color: const Color(0xFF92929D),
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Icon(
              Icons.search,
              color: const Color(0xFF92929D),
              size: 22.sp,
            ),
          ),
          prefixIconConstraints: BoxConstraints(
            minWidth: 40.w,
            minHeight: 24.h,
          ),
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 24.h,
                width: 1.w,
                color: const Color(0xFF171725),
              ),
              SizedBox(width: 8.w),
              IconButton(
                onPressed: onFilterPressed ?? () {},
                icon: Icon(
                  Icons.tune_rounded,
                  color: const Color(0xFF92929D),
                  size: 20.sp,
                ),
              ),
              SizedBox(width: 4.w),
            ],
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 14.h),
        ),
      ),
    );
  }
}
