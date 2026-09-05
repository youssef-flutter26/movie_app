import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeMovie extends StatelessWidget {
  final dynamic movie;

  const TimeMovie({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final year = movie.releaseDate != null && movie.releaseDate!.isNotEmpty
        ? movie.releaseDate!.split('-')[0]
        : 'N/A';
    final runtime = movie.runtime != null ? '${movie.runtime} Minutes' : 'N/A';
    final genre = (movie.genres != null && movie.genres!.isNotEmpty)
        ? movie.genres![0].name
        : 'Action';

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.calendar_today_rounded),
        SizedBox(width: 10.w),
        Text('$year |'),
        SizedBox(width: 5.w),
        const Icon(Icons.access_time),
        SizedBox(width: 10.w),
        Text('$runtime |'),
        SizedBox(width: 5.w),
        const Icon(Icons.movie),
        SizedBox(width: 10.w),
        Text(genre),
      ],
    );
  }
}
