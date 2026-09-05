import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/app_images.dart';
import 'package:movie_app/core/utils/app_styles.dart';
import 'package:movie_app/features/auth/presentation/widgets/custom_button.dart';
import 'package:movie_app/features/profile/presentation/widgets/custom_button_profile.dart';
import 'package:movie_app/features/profile/presentation/widgets/custom_edit_profile.dart';
import 'package:movie_app/features/profile/presentation/widgets/custom_premium_member.dart';
import 'package:movie_app/features/profile/presentation/widgets/custom_settings_item.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.h),
          Center(child: Text('Profile', style: TextStyles.semiBold16)),
          SizedBox(height: 24.h),
          const CustomEditProfile(),
          SizedBox(height: 24.h),
          const CustomPremiumMember(),
          SizedBox(height: 24.h),
          Text('Account', style: TextStyles.semiBold16),
          SizedBox(height: 8.h),
          CustomSettingsItem(
            imagePath: Assets.imagesProfile,
            title: 'Member',
            onImageTap: () {},
            onItemTap: () {},
            onArrowTap: () {},
            onTap: () {},
          ),
          CustomSettingsItem(
            imagePath: Assets.imagesChangepassword,
            title: 'Change Password',
            onImageTap: () {},
            onItemTap: () {},
            onArrowTap: () {},
            onTap: () {},
          ),
          SizedBox(height: 24.h),
          Text('General', style: TextStyles.semiBold16),
          SizedBox(height: 8.h),
          CustomSettingsItem(
            imagePath: Assets.imagesNotification,
            title: 'Notification',
            onImageTap: () {},
            onItemTap: () {},
            onArrowTap: () {},
            onTap: () {},
          ),
          CustomSettingsItem(
            imagePath: Assets.imagesLanguage,
            title: 'Language',
            onImageTap: () {},
            onItemTap: () {},
            onArrowTap: () {},
            onTap: () {},
          ),
          CustomSettingsItem(
            imagePath: Assets.imagesCountry,
            title: 'Country',
            onImageTap: () {},
            onItemTap: () {},
            onArrowTap: () {},
            onTap: () {},
          ),
          CustomSettingsItem(
            imagePath: Assets.imagesClearcache,
            title: 'Clear Cache',
            onImageTap: () {},
            onItemTap: () {},
            onArrowTap: () {},
            onTap: () {},
          ),
          SizedBox(height: 24.h),
          Text('More', style: TextStyles.semiBold16),
          SizedBox(height: 8.h),
          CustomSettingsItem(
            imagePath: Assets.imagesLegalandpolicies,
            title: 'Legal and Policies',
            onImageTap: () {},
            onItemTap: () {},
            onArrowTap: () {},
            onTap: () {},
          ),
          CustomSettingsItem(
            imagePath: Assets.imagesHelpl,
            title: 'Help & Feedback',
            onImageTap: () {},
            onItemTap: () {},
            onArrowTap: () {},
            onTap: () {},
          ),
          CustomSettingsItem(
            imagePath: Assets.imagesAboutus,
            title: 'About Us',
            onImageTap: () {},
            onItemTap: () {},
            onArrowTap: () {},
            onTap: () {},
          ),
          SizedBox(height: 16.h),
          CustomButtonProfile(),
        ],
      ),
    );
  }
}
