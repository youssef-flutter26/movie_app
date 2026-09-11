import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_images.dart';
import 'package:movie_app/core/utils/app_styles.dart';
import 'package:movie_app/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';

class LogOutButtonDialog extends StatelessWidget {
  const LogOutButtonDialog({super.key});

  static const String routeName = '/log_out_button_dialog';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFF1F1D2B),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(Assets.imagesTime, width: 70.w, height: 70.h),
            SizedBox(height: 16.h),
            Text(
              'Are you sure ?',
              style: TextStyles.semiBold16.copyWith(color: Colors.white),
            ), // Text
            SizedBox(height: 8.h),
            Text(
              'ullamcorper imperdiet urna id nec sed id sem. Pellentesque amet, enim purus gravida donec aliquet.',
              textAlign: TextAlign.center,
              style: TextStyles.regular13.copyWith(color: Colors.grey),
            ), // Text
            SizedBox(height: 24.h),
            BlocConsumer<ProfileCubit, ProfileState>(
              listener: (context, state) {
                if (state is LogoutSuccess) {
                  Navigator.pop(context);
                } else if (state is LogoutFailure) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.errMessage)));
                }
              },
              builder: (context, state) {
                final isLoading = state is LogoutLoading;
                return Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: isLoading
                            ? null
                            : () {
                                context.read<ProfileCubit>().logout(
                                  token: 'YOUR_TOKEN_HERE', // 👈 ضَع متغير التوكن الخاص بك هنا
                                );
                              },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: AppColors.ksecondaryColor,
                          ), // BorderSide
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.r),
                          ), // RoundedRectangleBorder
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                        ),
                        child: isLoading
                            ? SizedBox(
                                height: 20.h,
                                width: 20.w,
                                child: const CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: AppColors.ksecondaryColor,
                                ), // CircularProgressIndicator
                              ) // SizedBox
                            : Text(
                                'Log Out',
                                style: TextStyles.semiBold13.copyWith(
                                  color: AppColors.ksecondaryColor,
                                ),
                              ), // Text
                      ), // OutlinedButton
                    ), // Expanded
                    SizedBox(width: 12.w),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: isLoading
                            ? null
                            : () {
                                Navigator.pop(context);
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.ksecondaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.r),
                          ), // RoundedRectangleBorder
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                        ),
                        child: Text(
                          'Cancel',
                          style: TextStyles.semiBold13.copyWith(
                            color: Colors.white,
                          ),
                        ), // Text
                      ), // ElevatedButton
                    ), // Expanded
                  ], // Row
                );
              },
            ), // BlocConsumer
          ], // Column
        ), // Padding
      ), // Dialog
    );
  }
}
