import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/models/movie_model.dart';

class CustomPremium extends StatelessWidget {
  final MovieModel movie;

  const CustomPremium({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Tag Premium
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: Colors.amber[700],
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: Text(
            'Premium',
            style: TextStyle(
              color: Colors.white,
              fontSize: 10.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 8.h),

        Text(
          movie.title ?? 'No Title',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.h),

        Row(
          children: [
            Icon(
              Icons.calendar_today_outlined,
              size: 14.sp,
              color: Colors.grey,
            ),
            SizedBox(width: 4.w),
            Text(
              movie.releaseDate?.split('-').first ?? '',
              style: TextStyle(color: Colors.grey, fontSize: 11.sp),
            ),
          ],
        ),
        SizedBox(height: 6.h),

        Row(
          children: [
            Icon(Icons.star, size: 14.sp, color: Colors.amber),
            SizedBox(width: 4.w),
            Text(
              '${movie.voteAverage ?? 0.0}',
              style: TextStyle(color: Colors.grey, fontSize: 11.sp),
            ),
          ],
        ),
      ],
    );
  }
}
