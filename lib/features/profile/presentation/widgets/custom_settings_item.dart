import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_colors.dart';

class CustomSettingsItem extends StatelessWidget {
  const CustomSettingsItem({
    super.key,
    required this.imagePath,
    required this.title,
    this.valueText,
    this.onTap,
  });

  final String imagePath;
  final String title;
  final String? valueText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: const Color(0xFFFEFC88).withOpacity(0.15),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(8),
        child: Image.asset(imagePath, fit: BoxFit.contain),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (valueText != null)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                valueText!,
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
          const Icon(
            Icons.chevron_right,
            color: AppColors.ksecondaryColor,
            size: 20,
          ),
        ],
      ),
    );
  }
}
