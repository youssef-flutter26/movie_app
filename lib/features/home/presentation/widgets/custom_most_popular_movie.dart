import 'package:flutter/material.dart';

class CustomMostPopularMovies extends StatelessWidget {
  final String title;
  final VoidCallback? onSeeAllPressed;
  final TextStyle style;

  const CustomMostPopularMovies({
    super.key,
    required this.title,
    this.onSeeAllPressed,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: style),
        GestureDetector(
          onTap: onSeeAllPressed,
          child: const Text(
            'See All',
            style: TextStyle(
              color: Color(0xFF12CDD9),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
