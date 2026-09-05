import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_images.dart';

class EditImage extends StatelessWidget {
  const EditImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Image.asset(Assets.imagesAvatar2)],
    );
  }
}
