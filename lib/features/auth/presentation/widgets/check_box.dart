import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/app_colors.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    super.key,
    required this.isChecked,
    required this.onChecked,
  });

  final bool isChecked;
  final ValueChanged<bool> onChecked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChecked(!isChecked);
      },
      child: AnimatedContainer(
        width: 24.w,
        height: 24.h,
        duration: const Duration(milliseconds: 100),
        decoration: ShapeDecoration(
          color: isChecked ? Colors.green : AppColors.kprimaryColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1.50.w,
              color: isChecked ? Colors.transparent : Colors.grey,
            ),
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        child: isChecked
            ? Icon(Icons.check, size: 16.r, color: Colors.white)
            : const SizedBox(),
      ),
    );
  }
}
