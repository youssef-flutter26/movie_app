import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/app_images.dart';
import 'package:movie_app/core/utils/app_styles.dart';

class HelloUser extends StatelessWidget {
  const HelloUser({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    final String userName =
        (user?.displayName != null && user!.displayName!.isNotEmpty)
        ? user.displayName!
        : 'User';

    return Row(
      children: [
        CircleAvatar(
          radius: 20.r,
          backgroundImage:
              (user?.photoURL != null && user!.photoURL!.isNotEmpty)
              ? NetworkImage(user.photoURL!)
              : const AssetImage(Assets.imagesAvatar) as ImageProvider,
        ),
        SizedBox(width: 16.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello, $userName', style: TextStyles.bold19),
            Text(
              "Let's stream your favorite movie",
              style: TextStyles.regular13,
            ),
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite_border, color: Colors.white),
        ),
      ],
    );
  }
}
