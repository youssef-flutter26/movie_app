import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/app_images.dart'; // عدل المسار حسب مجلد الـ assets
import 'package:movie_app/core/utils/app_styles.dart';

class WishlistEmpty extends StatelessWidget {
  const WishlistEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Assets.imagesNoresultpng, // تأكد من اسم صورة الصندوق أو الشغور عندك
            width: 120.w,
            height: 120.h,
          ),
          SizedBox(height: 24.h),
          Text(
            'There Is No Movie Yet!',
            style: TextStyles.bold19.copyWith(color: Colors.white),
          ),
          SizedBox(height: 8.h),
          Text(
            'Find your movie by Type title,\ncategories, years, etc',
            textAlign: TextAlign.center,
            style: TextStyles.medium15.copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
