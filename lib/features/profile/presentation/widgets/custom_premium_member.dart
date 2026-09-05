import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/app_images.dart';
import 'package:movie_app/core/utils/app_styles.dart';

class CustomPremiumMember extends StatelessWidget {
  const CustomPremiumMember({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327.w,
      height: 110.h,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: Color(0xFFefc886),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Image.asset(Assets.imagesVector),
            ),
          ),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text('Premium Member', style: TextStyles.bold19),
              Text(
                'New movies are coming for you ,\n Download Now!',
                style: TextStyles.regular13,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
