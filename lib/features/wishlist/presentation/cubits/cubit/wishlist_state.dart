import 'package:movie_app/core/models/movie_model.dart'; // عدل المسار

abstract class WishlistState {}

class WishlistInitial extends WishlistState {}

class WishlistLoading extends WishlistState {}

class WishlistLoaded extends WishlistState {
  final List<MovieModel> wishlist;
  WishlistLoaded(this.wishlist);
}

class WishlistFailed extends WishlistState {
  final String error;
  WishlistFailed(this.error);
}
