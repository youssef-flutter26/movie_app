import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/app_images.dart';
import 'package:movie_app/features/details/presentation/widgets/build_social_icon.dart';
import 'package:url_launcher/url_launcher.dart';

class BuildSocialItem extends StatelessWidget {
  const BuildSocialItem({super.key});

  Future<void> openPlatformUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Could not launch $urlString');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // 1. فيسبوك
        buildSocialIcon(
          color: const Color(0xFF1877F2),
          icon: Icons.facebook,
          onTap: () {
            openPlatformUrl(
              'https://www.facebook.com/sharer/sharer.php?u=https://movieapp.com',
            );
          },
        ),

        // 2. إنستجرام
        GestureDetector(
          onTap: () {
            openPlatformUrl('https://www.instagram.com');
          },
          child: Image.asset(
            Assets.imagesInsta,
            width: 40.w,
            height: 40.h,
            fit: BoxFit.cover,
          ),
        ),

        // 3. ماسنجر
        GestureDetector(
          onTap: () {
            openPlatformUrl('https://www.messenger.com');
          },
          child: Image.asset(
            Assets.imagesMessanger,
            width: 40.w,
            height: 40.h,
            fit: BoxFit.cover,
          ),
        ),

        // 4. تليجرام / إرسال
        buildSocialIcon(
          color: const Color(0xFF12CDD9).withOpacity(0.2),
          icon: Icons.near_me_rounded,
          iconColor: const Color(0xFF12CDD9),
          onTap: () {
            openPlatformUrl(
              'https://t.me/share/url?url=https://movieapp.com&text=Check%20out%20this%20movie!',
            );
          },
        ),
      ],
    );
  }
}
