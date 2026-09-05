import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/app_styles.dart';

class Rating extends StatelessWidget {
  final double voteAverage;

  const Rating({super.key, required this.voteAverage});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.star, color: Colors.orange),
        SizedBox(width: 5.w),
        Text(
          voteAverage.toStringAsFixed(1),
          style: TextStyles.bold13.copyWith(color: Colors.orange),
        ),
      ],
    );
  }
}
