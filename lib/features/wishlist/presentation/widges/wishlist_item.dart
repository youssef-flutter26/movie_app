import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/models/movie_model.dart';
import 'package:movie_app/core/utils/app_styles.dart';
import 'package:movie_app/features/wishlist/presentation/cubits/cubit/wishlist_cubit.dart';

class WishlistItem extends StatelessWidget {
  final MovieModel movie;

  const WishlistItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 130.h,
      decoration: BoxDecoration(
        color: const Color(0xff252836),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 121.w,
            height: 130.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.network(
                'https://image.tmdb.org/t/p/w500${movie.posterPath ?? ''}',
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(color: Colors.grey),
              ),
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Movie', style: TextStyles.semiBold16),
                SizedBox(height: 8.h),
                Text(
                  movie.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.bold19,
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.orange, size: 18),
                    SizedBox(width: 4.w),
                    Text(
                      movie.voteAverage.toStringAsFixed(1),
                      style: TextStyles.medium15.copyWith(color: Colors.orange),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        context.read<WishlistCubit>().toggleWishlist(movie);
                      },
                      icon: const Icon(Icons.favorite, color: Colors.red),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
