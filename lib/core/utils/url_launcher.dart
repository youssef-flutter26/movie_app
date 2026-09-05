import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openPlatformUrl(String urlString) async {
  final Uri url = Uri.parse(urlString);
  try {
    bool launched = await launchUrl(url, mode: LaunchMode.externalApplication);
    if (!launched) {
      debugPrint('Could not launch $urlString');
    }
  } catch (e) {
    debugPrint('Error launching url: $e');
  }
}
