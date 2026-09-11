import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/constant.dart';
import 'package:movie_app/core/services/shared_pref.dart';
import 'package:movie_app/core/utils/app_images.dart';
import 'package:movie_app/core/utils/app_styles.dart';
import 'package:movie_app/features/profile/data/models/user_model.dart';
import 'package:movie_app/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:movie_app/features/profile/presentation/widgets/edit_profile.dart';

class CustomEditProfile extends StatelessWidget {
  const CustomEditProfile({super.key, required this.userModel});

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          // الصورة الشخصية
          ClipRRect(
            borderRadius: BorderRadius.circular(50.r),
            child:
                (userModel.avatarUrl != null && userModel.avatarUrl!.isNotEmpty)
                ? Image.network(
                    userModel.avatarUrl!,
                    width: 56.w,
                    height: 56.h,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Image.asset(
                      Assets.imagesProfile,
                      width: 56.w,
                      height: 56.h,
                    ),
                  )
                : Image.asset(Assets.imagesProfile, width: 56.w, height: 56.h),
          ),
          SizedBox(width: 16.w),

          // الاسم والإيميل
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  (userModel.name != null && userModel.name!.isNotEmpty)
                      ? userModel.name!
                      : 'User Name',
                  style: TextStyles.semiBold16.copyWith(
                    fontSize: 18.sp,
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text(
                  (userModel.email != null && userModel.email!.isNotEmpty)
                      ? userModel.email!
                      : (userModel.name != null && userModel.name!.isNotEmpty)
                      ? '${userModel.name}@gmail.com'
                      : 'No Email Available',
                  style: TextStyles.regular13.copyWith(color: Colors.white70),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          // زر التعديل
          GestureDetector(
            onTap: () async {
              await Navigator.pushNamed(
                context,
                EditProfile.routeName,
                arguments: userModel,
              );

              if (context.mounted) {
                context.read<ProfileCubit>().getUserProfile(
                  token: SharedPref.getString(tmdbToken),
                );
              }
            },
            child: Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white38, width: 1.5),
              ),
              child: Icon(
                Icons.edit_outlined,
                color: Colors.white,
                size: 18.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
