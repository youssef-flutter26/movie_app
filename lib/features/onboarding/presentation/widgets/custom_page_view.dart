import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_images.dart';
import 'package:movie_app/features/onboarding/presentation/widgets/Custom_page_view_item.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        CustomPageViewItem(
          image: Assets.imagesImage11,
          title: 'Lorem ipsum dolor sit amet\nconsecteur esplicit',
          subtitle: 'Semper in cursus magna et eu varius nunc adipiscing. Elementum justo, laoreet id sem semper parturient.',
        ),
        CustomPageViewItem(
          image: Assets.imagesImage2,
          title: 'Lorem ipsum dolor sit\namet consecteur esplicit',
          subtitle: 'Semper in cursus magna et eu varius nunc adipiscing. Elementum justo, laoreet id sem semper parturient.',
        ),
        CustomPageViewItem(
          image: Assets.imagesImage33,
          title: 'Lorem ipsum dolor sit amet\nconsecteur esplicit',
          subtitle: 'Semper in cursus magna et eu varius nunc adipiscing. Elementum justo, laoreet id sem semper parturient.',
        ),
      ],
    );
  }
}
