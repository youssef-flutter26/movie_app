import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_styles.dart';

class CustomButtonProfile extends StatelessWidget {
  const CustomButtonProfile({super.key, this.onTap, this.isLoading = false});

  final VoidCallback? onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading ? null : onTap,
      borderRadius: BorderRadius.circular(32.r),
      child: Container(
        width: 327.w,
        height: 56.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32.r),
          color: AppColors.kprimaryColor,
          border: Border.all(color: AppColors.ksecondaryColor, width: 1.w),
        ),
        child: Center(
          child: isLoading
              ? SizedBox(
                  width: 24.w,
                  height: 24.h,
                  child: const CircularProgressIndicator(
                    color: AppColors.ksecondaryColor,
                    strokeWidth: 2,
                  ),
                )
              : Text(
                  'Log Out',
                  style: TextStyles.semiBold16.copyWith(
                    color: AppColors.ksecondaryColor,
                  ),
                ),
        ),
      ),
    );
  }
}
