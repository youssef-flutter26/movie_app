import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_styles.dart';

class CustomButtonProfile extends StatelessWidget {
  const CustomButtonProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327.w,
      height: 56.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32.r),
        color: AppColors.kprimaryColor,
        border: Border.all(color: AppColors.ksecondaryColor, width: 1.w),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Log Out',
            style: TextStyles.semiBold16.copyWith(
              color: AppColors.ksecondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
