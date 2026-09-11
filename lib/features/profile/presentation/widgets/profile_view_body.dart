import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/constant.dart';
import 'package:movie_app/core/utils/app_images.dart';
import 'package:movie_app/core/utils/app_styles.dart';
import 'package:movie_app/features/profile/data/models/user_model.dart';
import 'package:movie_app/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:movie_app/features/profile/presentation/widgets/custom_button_profile.dart';
import 'package:movie_app/features/profile/presentation/widgets/custom_edit_profile.dart';
import 'package:movie_app/features/profile/presentation/widgets/custom_premium_member.dart';
import 'package:movie_app/features/profile/presentation/widgets/custom_settings_item.dart';
import 'package:movie_app/features/profile/presentation/widgets/language_view.dart';
import 'package:movie_app/features/profile/presentation/widgets/legal_and_policy.dart';
import 'package:movie_app/features/profile/presentation/widgets/log_out_button.dart';
import 'package:movie_app/features/profile/presentation/widgets/notification.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  UserModel? cachedUser;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProfileCubit>().getUserProfile(token: tmdbToken);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is UpdateProfileSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Profile updated successfully'),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 2),
            ),
          );
        }
      },
      builder: (context, state) {
        // تحديث نموذج المستخدم حسب الحالة
        if (state is ProfileSuccess) {
          cachedUser = state.userModel;
        } else if (state is UpdateProfileSuccess) {
          cachedUser = state.userModel;
        }

        if (state is ProfileLoading && cachedUser == null) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 100.0),
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (state is ProfileFailure && cachedUser == null) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Text(state.errMessage, style: TextStyles.semiBold16),
            ),
          );
        }

        final userModel = cachedUser ?? const UserModel();

        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.h),
                Center(child: Text('Profile', style: TextStyles.semiBold16)),
                SizedBox(height: 24.h),
                CustomEditProfile(userModel: userModel),
                SizedBox(height: 24.h),
                const CustomPremiumMember(isPremium: false),
                SizedBox(height: 24.h),
                Text('Account', style: TextStyles.semiBold16),
                SizedBox(height: 8.h),
                CustomSettingsItem(
                  imagePath: Assets.imagesProfile,
                  title: 'Member',
                  onTap: () {},
                ),
                CustomSettingsItem(
                  imagePath: Assets.imagesChangepassword,
                  title: 'Change Password',
                  onTap: () {},
                ),
                SizedBox(height: 24.h),
                Text('General', style: TextStyles.semiBold16),
                SizedBox(height: 8.h),
                CustomSettingsItem(
                  imagePath: Assets.imagesNotification,
                  title: 'Notification',
                  onTap: () {
                    Navigator.pushNamed(context, NotificationView.routeName);
                  },
                ),
                CustomSettingsItem(
                  imagePath: Assets.imagesLanguage,
                  title: 'Language',
                  onTap: () {
                    Navigator.pushNamed(context, LanguageView.routeName);
                  },
                ),
                CustomSettingsItem(
                  imagePath: Assets.imagesCountry,
                  title: 'Country',
                  onTap: () {},
                ),
                CustomSettingsItem(
                  imagePath: Assets.imagesClearcache,
                  title: 'Clear cache',
                  onTap: () {},
                ),
                SizedBox(height: 24.h),
                Text('More', style: TextStyles.semiBold16),
                SizedBox(height: 8.h),
                CustomSettingsItem(
                  imagePath: Assets.imagesLegalandpolicies,
                  title: 'Legal and Policies',
                  onTap: () {
                    Navigator.pushNamed(context, LegalAndPolicy.routeName);
                  },
                ),
                CustomSettingsItem(
                  imagePath: Assets.imagesHelpl,
                  title: 'Help & Feedback',
                  onTap: () {},
                ),
                CustomSettingsItem(
                  imagePath: Assets.imagesAboutus,
                  title: 'About Us',
                  onTap: () {},
                ),
                SizedBox(height: 16.h),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => const LogOutButtonDialog(),
                    );
                  },
                  child: const CustomButtonProfile(),
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
