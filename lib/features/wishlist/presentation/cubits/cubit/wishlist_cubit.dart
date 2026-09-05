import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/models/movie_model.dart';
import 'package:movie_app/features/wishlist/data/wishlist_local_data_source.dart';
import 'package:movie_app/features/wishlist/presentation/cubits/cubit/wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  final WishlistLocalDataSource wishlistLocalDataSource;

  WishlistCubit(this.wishlistLocalDataSource) : super(WishlistInitial());

  Future<void> fetchWishlist() async {
    emit(WishlistLoading());
    try {
      final wishlist = await wishlistLocalDataSource.getWishlist();
      emit(WishlistLoaded(wishlist));
    } catch (e) {
      emit(WishlistFailed(e.toString()));
    }
  }

  Future<void> toggleWishlist(MovieModel movie) async {
    await wishlistLocalDataSource.toggleWishlist(movie);
    fetchWishlist(); // إعادة جلب القائمة وتحديث الـ UI فوراً
  }
}
