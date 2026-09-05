import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/app_styles.dart';
import 'package:movie_app/features/details/presentation/widgets/share.dart';
import 'package:url_launcher/url_launcher.dart';

class PlayAndInstall extends StatelessWidget {
  const PlayAndInstall({super.key});

  // دالة لفتح الرابط خارجيًا لتشغيل أو تحميل الفيديو
  Future<void> _launchUrl(String urlString, BuildContext context) async {
    final Uri url = Uri.parse(urlString);
    try {
      bool launched = await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );
      if (!launched && context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Could not open link')));
      }
    } catch (e) {
      debugPrint('Error launching URL: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // 1. زرار Play
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.orange),
          ),
          onPressed: () {
            // رابط تشغيل تريلر الفيلم على يوتيوب
            _launchUrl('https://www.youtube.com/watch?v=g4Hbz2jLxvQ', context);
          },
          child: Row(
            children: [
              const Icon(Icons.play_arrow_rounded, color: Colors.white),
              SizedBox(width: 5.w),
              Text('Play', style: TextStyles.bold16),
            ],
          ),
        ),

        SizedBox(width: 10.w),

        // 2. زرار Download
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.grey.shade800),
          ),
          onPressed: () {
            // يمكن توجيه المستخدم لرابط تحميل أو إظهار توست/سناك بار
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Downloading started...'),
                duration: Duration(seconds: 2),
              ),
            );
          },
          child: const Icon(Icons.download, color: Colors.orange),
        ),

        SizedBox(width: 10.w),

        // 3. زرار Share
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.grey.shade800),
          ),
          onPressed: () {
            showGeneralDialog(
              context: context,
              barrierDismissible: true,
              barrierLabel: '',
              barrierColor: Colors.black.withOpacity(0.3),
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (context, anim1, anim2) {
                return BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 8.w, sigmaY: 8.h),
                  child: const Share(),
                );
              },
            );
          },
          child: const Icon(Icons.ios_share, color: Color(0xFF12CDD9)),
        ),
      ],
    );
  }
}
