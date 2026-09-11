import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/app_images.dart';
import 'package:movie_app/core/utils/app_styles.dart';

class CustomPremiumMember extends StatelessWidget {
  const CustomPremiumMember({super.key, required this.isPremium, this.onTap});

  final bool isPremium;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 327.w,
        height: 110.h,
        decoration: BoxDecoration(
          color: isPremium ? const Color(0xFF1F1D2B) : Colors.orange,
          borderRadius: BorderRadius.circular(16.r),
          border: isPremium
              ? Border.all(color: const Color(0xFFFEFC88), width: 1.w)
              : null,
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFFEFC88),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Image.asset(Assets.imagesVector),
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    isPremium ? 'Premium Account' : 'Upgrade to Premium',
                    style: TextStyles.bold19,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    isPremium
                        ? 'Enjoy unlimited access to all movie content.'
                        : 'New movies are coming for you ,\nDownload Now!',
                    style: TextStyles.regular13,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
