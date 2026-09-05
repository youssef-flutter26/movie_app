import 'package:flutter/material.dart';
import 'package:movie_app/features/auth/presentation/views/create_new_password_view.dart';
import 'package:movie_app/features/auth/presentation/views/login_view.dart';
import 'package:movie_app/features/auth/presentation/views/reset_password_view.dart';
import 'package:movie_app/features/auth/presentation/views/sign_up.dart';
import 'package:movie_app/features/auth/presentation/views/start_login.dart';
import 'package:movie_app/features/details/presentation/views/movie_details.dart';
import 'package:movie_app/features/details/presentation/widgets/share.dart';
import 'package:movie_app/features/home/presentation/views/home_view.dart';
import 'package:movie_app/features/home/presentation/widgets/most_popular_movie.dart';
import 'package:movie_app/features/onboarding/presentation/views/on_boarding_view.dart';
import 'package:movie_app/features/profile/presentation/views/profile_view.dart';
import 'package:movie_app/features/profile/presentation/widgets/edit_profile.dart';
import 'package:movie_app/features/search/presentation/views/search_result.dart';
import 'package:movie_app/features/search/presentation/views/search_view.dart';
import 'package:movie_app/features/splash/presentation/views/splash_view.dart';
import 'package:movie_app/features/wishlist/presentation/views/whishlist_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case EditProfile.routeName:
      return MaterialPageRoute(builder: (context) => const EditProfile());
    case ProfileView.routeName:
      return MaterialPageRoute(builder: (context) => const ProfileView());
    case MostPopularMovie.routeName:
      return MaterialPageRoute(builder: (context) => const MostPopularMovie());
    case WhishlistView.routeName:
      return MaterialPageRoute(builder: (context) => const WhishlistView());
    case Share.routeName:
      return MaterialPageRoute(builder: (context) => const Share());
    case SearchView.routeName:
      return MaterialPageRoute(builder: (context) => const SearchView());
    case MovieDetails.routeName:
      final movieId = settings.arguments as int;
      return MaterialPageRoute(builder: (_) => MovieDetails(movieId: movieId));
    case SearchResult.routeName:
      return MaterialPageRoute(builder: (context) => const SearchResult());

    case CreateNewPasswordView.routeName:
      return MaterialPageRoute(
        builder: (context) => const CreateNewPasswordView(),
      );
    case ResetPasswordView.routeName:
      return MaterialPageRoute(builder: (context) => const ResetPasswordView());
    case SignUp.routeName:
      return MaterialPageRoute(builder: (context) => const SignUp());
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());
    case StartLogin.routeName:
      return MaterialPageRoute(builder: (context) => const StartLogin());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
    default:
      return MaterialPageRoute(
        builder: (context) =>
            const Scaffold(body: Center(child: Text('No Route Defined'))),
      );
  }
}
