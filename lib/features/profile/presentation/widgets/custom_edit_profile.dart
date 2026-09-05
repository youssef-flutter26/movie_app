import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_images.dart';
import 'package:movie_app/core/utils/app_styles.dart';
import 'package:movie_app/features/profile/presentation/widgets/edit_profile.dart';

class CustomEditProfile extends StatelessWidget {
  const CustomEditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327.w,
      height: 86.h,
      decoration: BoxDecoration(
        color: AppColors.kprimaryColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.3),
            blurRadius: 4.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: Image.asset(Assets.imagesAvatar),
          ),
          SizedBox(width: 16.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Tiffany', style: TextStyles.bold16),
              Text('Tiffanyjearsey@gmail.com', style: TextStyles.regular13),
            ],
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, EditProfile.routeName);
              },

              child: Image.asset(Assets.imagesIconEdit),
            ),
          ),
        ],
      ),
    );
  }
}
