import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/widgets/custom_text_field.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({
    super.key,
    this.onSubmitted,
    this.onChanged,
  });

  final void Function(String)? onSubmitted;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hintText: 'Type title, categories, years, etc',
      prefixIcon: const Icon(Icons.search_rounded, color: Color(0xFF92929D)),
      fillColor: const Color(0xFF252836),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24.r),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24.r),
        borderSide: const BorderSide(color: Color(0xFF12CDD9)),
      ),
      onFieldSubmitted: onSubmitted,
      onChanged: onChanged,
    );
  }
}