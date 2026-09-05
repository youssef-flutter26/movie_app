import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:movie_app/core/models/movie_model.dart';

class WishlistLocalDataSource {
  static const String _wishlistKey = 'user_wishlist_movies';

  Future<List<MovieModel>> getWishlist() async {
    final prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString(_wishlistKey);
    if (jsonString == null) return [];

    List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList.map((item) => MovieModel.fromJson(item)).toList();
  }

  Future<bool> toggleWishlist(MovieModel movie) async {
    final prefs = await SharedPreferences.getInstance();
    List<MovieModel> wishlist = await getWishlist();

    // البحث عن مكان الفيلم عن طريق الـ ID لمنع التكرار
    int existingIndex = wishlist.indexWhere((item) => item.id == movie.id);

    if (existingIndex != -1) {
      wishlist.removeAt(existingIndex); // حذفه لو كان موجود بالفعل
    } else {
      wishlist.add(movie); // إضافته لو مش موجود
    }

    // حفظ القائمة الجديدة بعد التعديل
    List<Map<String, dynamic>> jsonList = wishlist
        .map((item) => item.toJson())
        .toList();

    await prefs.setString(_wishlistKey, jsonEncode(jsonList));

    return existingIndex == -1; // ترجع true لو تم الإضافة، و false لو تم الحذف
  }

  Future<bool> isFavorite(int movieId) async {
    List<MovieModel> wishlist = await getWishlist();
    return wishlist.any((item) => item.id == movieId);
  }
}
