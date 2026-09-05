import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_colors.dart';

class CustomSettingsItem extends StatelessWidget {
  const CustomSettingsItem({
    super.key,
    required this.imagePath,
    required this.title,
    this.onImageTap,
    this.onItemTap,
    this.onArrowTap,
    required Null Function() onTap,
  });

  final String imagePath;
  final String title;
  final VoidCallback? onImageTap;
  final VoidCallback? onItemTap;
  final VoidCallback? onArrowTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: InkWell(
        onTap: onImageTap,
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFFEFC886).withOpacity(0.15),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(8),
          child: Image.asset(imagePath, fit: BoxFit.contain),
        ),
      ),
      title: InkWell(
        onTap: onItemTap,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      trailing: IconButton(
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        icon: const Icon(
          Icons.chevron_right,
          color: AppColors.ksecondaryColor,
          size: 20,
        ),
        onPressed: onArrowTap,
      ),
    );
  }
}
