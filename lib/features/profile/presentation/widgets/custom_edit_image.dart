import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movie_app/core/utils/app_images.dart';

class CustomEditImage extends StatefulWidget {
  const CustomEditImage({
    super.key,
    this.avatarUrl,
    this.onTap,
    this.onImagePicked,
  });

  final String? avatarUrl;
  final VoidCallback? onTap;
  final ValueChanged<File>? onImagePicked;

  @override
  State<CustomEditImage> createState() => _CustomEditImageState();
}

class _CustomEditImageState extends State<CustomEditImage> {
  File? _selectedImage;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
      if (widget.onImagePicked != null) {
        widget.onImagePicked!(_selectedImage!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          _pickImage();
          if (widget.onTap != null) {
            widget.onTap!();
          }
        },
        child: SizedBox(
          width: 100.w,
          height: 100.h,
          child: ClipOval(child: _buildImageWidget()), // ClipOval
        ), // SizedBox
      ), // GestureDetector
    ); // Center
  }

  Widget _buildImageWidget() {
    // 1. إذا اختار المستخدم صورة جديدة من المعرض
    if (_selectedImage != null) {
      return Image.file(
        _selectedImage!,
        width: 100.w,
        height: 100.h,
        fit: BoxFit.cover,
      );
    }

    // 2. إذا كان هناك رابط أو مسار ملف محفوظ سابقاً
    if (widget.avatarUrl != null && widget.avatarUrl!.isNotEmpty) {
      final isLocalFile = File(widget.avatarUrl!).existsSync();

      if (isLocalFile) {
        return Image.file(
          File(widget.avatarUrl!),
          width: 100.w,
          height: 100.h,
          fit: BoxFit.cover,
        );
      }

      return Image.network(
        widget.avatarUrl!,
        width: 100.w,
        height: 100.h,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Image.asset(
          Assets.imagesAvatar2,
          width: 100.w,
          height: 100.h,
          fit: BoxFit.cover,
        ),
      );
    }

    // 3. الصورة الافتراضية عند عدم وجود أي صورة
    return Image.asset(
      Assets.imagesAvatar2,
      width: 100.w,
      height: 100.h,
      fit: BoxFit.cover,
    );
  }
}
