import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/app_styles.dart';
import 'package:movie_app/features/profile/data/models/legal_policy_model.dart';

class LegalAndPolicyBody extends StatelessWidget {
  const LegalAndPolicyBody({super.key, required this.policy});

  final LegalPolicyModel policy;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 16.0.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(policy.title, style: TextStyles.bold16),
          SizedBox(height: 12.h),
          Text(
            policy.content, // أو حسب اسم متغير النص داخل LegalPolicyModel عندك (مثلاً description أو content)
            style: TextStyles.regular13,
          ),
        ],
      ),
    );
  }
}
