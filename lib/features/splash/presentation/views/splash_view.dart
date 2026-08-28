import 'package:flutter/material.dart';
import 'package:movie_app/features/splash/presentation/views/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const new({super.key});
  static const String routeName = 'splash';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SplashViewBody());
  }
}
