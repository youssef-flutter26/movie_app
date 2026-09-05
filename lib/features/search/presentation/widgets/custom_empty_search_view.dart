import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/app_images.dart';
import 'package:movie_app/core/utils/app_styles.dart';

class CustomEmptySearchView extends StatelessWidget {
  const CustomEmptySearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              Assets.imagesSlider1,
              width: 120.w,
              height: 120.h,
              errorBuilder: (context, error, stackTrace) {
                return Icon(
                  Icons.search_off_rounded,
                  size: 80.sp,
                  color: Colors.grey,
                );
              },
            ),
            SizedBox(height: 24.h),
            Text(
              'We Are Sorry, We Can Not Find The Movie :(',
              textAlign: TextAlign.center,
              style: TextStyles.bold19.copyWith(color: Colors.white),
            ),
            SizedBox(height: 12.h),
            Text(
              'Find your movie by Type title, categories, years, etc',
              textAlign: TextAlign.center,
              style: TextStyles.regular13.copyWith(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
