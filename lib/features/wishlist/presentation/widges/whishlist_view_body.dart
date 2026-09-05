import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/app_styles.dart';
import 'package:movie_app/features/wishlist/presentation/cubits/cubit/wishlist_cubit.dart';
import 'package:movie_app/features/wishlist/presentation/cubits/cubit/wishlist_state.dart';
import 'package:movie_app/features/wishlist/presentation/widges/wishlist_empty.dart';
import 'package:movie_app/features/wishlist/presentation/widges/wishlist_item.dart';

class WishlistViewBody extends StatefulWidget {
  const WishlistViewBody({super.key});

  @override
  State<WishlistViewBody> createState() => _WishlistViewBodyState();
}

class _WishlistViewBodyState extends State<WishlistViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<WishlistCubit>().fetchWishlist();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 20.h),
      child: Column(
        children: [
          Center(child: Text('Wishlist', style: TextStyles.bold23)),
          SizedBox(height: 20.h),
          Expanded(
            child: BlocBuilder<WishlistCubit, WishlistState>(
              builder: (context, state) {
                if (state is WishlistLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is WishlistLoaded) {
                  if (state.wishlist.isEmpty) {
                    return const WishlistEmpty();
                  }
                  return ListView.separated(
                    itemCount: state.wishlist.length,
                    separatorBuilder: (_, __) => SizedBox(height: 20.h),
                    itemBuilder: (context, index) {
                      return WishlistItem(movie: state.wishlist[index]);
                    },
                  );
                }
                return const WishlistEmpty();
              },
            ),
          ),
        ],
      ),
    );
  }
}
