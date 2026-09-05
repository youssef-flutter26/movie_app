import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/models/movie_model.dart';
import 'package:movie_app/core/widgets/build_appbar.dart';
import 'package:movie_app/features/search/presentation/widgets/todary_card.dart';

class MostPopularMovie extends StatelessWidget {
  static const routeName = 'mostPopularMovie';

  const MostPopularMovie({super.key});

  @override
  Widget build(BuildContext context) {
    final movies =
        ModalRoute.of(context)?.settings.arguments as List<MovieModel>? ?? [];

    return Scaffold(
      appBar: buildAppBar(context, tittle: 'Most Popular Movie'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0.h),
                child: TodayCard(movie: movies[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}
