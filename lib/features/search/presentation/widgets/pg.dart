import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_styles.dart';

class PG extends StatelessWidget {
  const PG({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 43.w,
      height: 20.h,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: AppColors.ksecondaryColor),
        borderRadius: BorderRadius.circular(3.r),
      ),
      child: Text(
        'PG-13',
        style: TextStyles.bold13.copyWith(color: AppColors.ksecondaryColor),
        textAlign: TextAlign.center,
      ),
    );
  }
}
