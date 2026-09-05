import 'package:flutter/material.dart';

// 1. كود النقطة الواحدة
class DotIndicator extends StatelessWidget {
  final bool isActive;

  const DotIndicator({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: isActive ? 24 : 8,
      decoration: BoxDecoration(
        color: isActive
            ? const Color(0xFF12CDD9)
            : const Color(0xFF12CDD9).withOpacity(0.32),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}

class DotsIndicatorRow extends StatelessWidget {
  final int activeIndex;
  final int count;

  const DotsIndicatorRow({
    super.key,
    required this.activeIndex,
    this.count = 3,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        count,
        (index) => DotIndicator(isActive: index == activeIndex),
      ),
    );
  }
}
