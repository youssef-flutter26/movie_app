import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/constant.dart';
import 'package:movie_app/core/helper/on_generate_route.dart';
import 'package:movie_app/core/services/custom_bloc_observer.dart';
import 'package:movie_app/core/services/git_it_service.dart';
import 'package:movie_app/core/services/notification_service.dart';
import 'package:movie_app/core/services/shared_pref.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/features/profile/data/repos/profile_repo.dart';
import 'package:movie_app/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:movie_app/features/splash/presentation/views/splash_view.dart';
import 'package:movie_app/features/wishlist/data/wishlist_local_data_source.dart';
import 'package:movie_app/features/wishlist/presentation/cubits/cubit/wishlist_cubit.dart';
import 'package:movie_app/firebase_options.dart';

void checkMyModels() async {
  try {
    final response = await Dio().get(
      'https://generativelanguage.googleapis.com/v1beta/models?key=$aiAPiKey',
    );
    print('================ AVAILABLE MODELS ================');
    for (var model in response.data['models']) {
      print(model['name']);
    }
    print('==================================================');
  } catch (e) {
    print('Error listing models: $e');
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
  Bloc.observer = CustomBlocObserver();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await NotificationService.init();

  setup();

  // فحص الموديلات المتاحة
  checkMyModels();

  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<WishlistCubit>(
            create: (context) =>
                WishlistCubit(WishlistLocalDataSource())..fetchWishlist(),
          ),
          BlocProvider<ProfileCubit>(
            create: (context) => ProfileCubit(getIt<ProfileRepo>()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.dark,
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: AppColors.kprimaryColor,
          ),
          onGenerateRoute: onGenerateRoute,
          initialRoute: SplashView.routeName,
        ),
      ),
    );
  }
}
