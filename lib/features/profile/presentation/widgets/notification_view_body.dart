import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_styles.dart';
import 'package:movie_app/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';

class NotificationViewBody extends StatelessWidget {
  const NotificationViewBody({super.key, required this.isNotificationEnabled});

  final bool isNotificationEnabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Messages Notifications',
            style: TextStyles.semiBold16.copyWith(color: Colors.white),
          ),
          SizedBox(height: 24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Show Notifications',
                style: TextStyles.medium15.copyWith(color: Colors.white),
              ),
              CupertinoSwitch(
                value: isNotificationEnabled,
                activeColor: AppColors.ksecondaryColor,
                onChanged: (value) {
                  BlocProvider.of<ProfileCubit>(context)
                      .toggleNotification(value);
                },
              ),
            ],
          ),
          SizedBox(height: 24.h),
          Text(
            'Exceptions',
            style: TextStyles.semiBold16.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
