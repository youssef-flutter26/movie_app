import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_styles.dart';
import 'package:movie_app/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';

class LanguageViewBody extends StatelessWidget {
  const LanguageViewBody({
    super.key,
    required this.selectedLanguage,
    required this.suggestedLanguages,
    required this.otherLanguages,
  });

  final String selectedLanguage;
  final List<String> suggestedLanguages;
  final List<String> otherLanguages;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Text(
              'Suggested Languages',
              style: TextStyles.medium15.copyWith(color: Colors.grey),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 12.h)),
          SliverList.builder(
            itemCount: suggestedLanguages.length,
            itemBuilder: (context, index) {
              return _buildLanguageItem(context, suggestedLanguages[index]);
            },
          ),
          SliverToBoxAdapter(child: SizedBox(height: 16.h)),
          SliverToBoxAdapter(
            child: Text(
              'Other Languages',
              style: TextStyles.medium15.copyWith(color: Colors.grey),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 12.h)),
          SliverList.builder(
            itemCount: otherLanguages.length,
            itemBuilder: (context, index) {
              return _buildLanguageItem(context, otherLanguages[index]);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageItem(BuildContext context, String language) {
    final isSelected = selectedLanguage == language;
    return InkWell(
      onTap: () {
        BlocProvider.of<ProfileCubit>(context).changeLanguage(language);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 14.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              language,
              style: TextStyles.semiBold16.copyWith(
                color: isSelected ? AppColors.ksecondaryColor : Colors.white,
              ),
            ),
            if (isSelected)
              Icon(Icons.check, color: AppColors.ksecondaryColor, size: 20.sp),
          ],
        ),
      ),
    );
  }
}
