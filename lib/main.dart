import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
  Bloc.observer = CustomBlocObserver();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // تهيئة خدمة الإشعارات المحلية
  await NotificationService.init();

  setup();
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
          ), // BlocProvider
          BlocProvider<ProfileCubit>(
            create: (context) => ProfileCubit(getIt<ProfileRepo>()),
          ), // BlocProvider
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.dark,
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: AppColors.kprimaryColor,
          ), // ThemeData
          onGenerateRoute: onGenerateRoute,
          initialRoute: SplashView.routeName,
        ), // MaterialApp
      ), // MultiBlocProvider
    ); // ScreenUtilInit
  }
}
