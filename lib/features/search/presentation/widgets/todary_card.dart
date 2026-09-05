import 'package:flutter/material.dart';
import 'package:movie_app/core/models/movie_model.dart';
import 'package:movie_app/features/home/presentation/widgets/category_card.dart';
import 'package:movie_app/features/search/presentation/widgets/custom_premium.dart';

class TodayCard extends StatelessWidget {
  const TodayCard({super.key, this.movie});

  final MovieModel? movie;

  @override
  Widget build(BuildContext context) {
    if (movie == null) return const SizedBox.shrink();

    return Row(
      children: [
        Expanded(child: CategoryCard(movie: movie!)),
        const SizedBox(width: 12),
        Expanded(child: CustomPremium(movie: movie!)),
      ],
    );
  }
}
