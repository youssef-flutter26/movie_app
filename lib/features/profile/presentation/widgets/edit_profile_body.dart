import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/app_styles.dart';
import 'package:movie_app/features/profile/presentation/widgets/custom_edit_image.dart';
import 'package:movie_app/features/profile/presentation/widgets/edit_text_form_field.dart';

class EditProfileBody extends StatelessWidget {
  const EditProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0.w),
      child: Column(
        children: [
          EditImage(),

          Text('Tiffany', style: TextStyles.bold19),

          Text(
            'tiffany@gmail.com',
            style: TextStyles.regular16.copyWith(color: Colors.grey),
          ),
          SizedBox(height: 16.h),
          EditTextFormField(labelText: 'Name'),
          SizedBox(height: 16.h),
          EditTextFormField(labelText: 'Email'),
          SizedBox(height: 16.h),

          EditTextFormField(labelText: 'Name'),
        ],
      ),
    );
  }
}
