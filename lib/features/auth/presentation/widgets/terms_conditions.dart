import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_styles.dart';
import 'package:movie_app/features/auth/presentation/widgets/check_box.dart';

class TermsAndConditionsWidget extends StatefulWidget {
  const TermsAndConditionsWidget({super.key, required this.onChanged});

  final ValueChanged<bool> onChanged;

  @override
  State<TermsAndConditionsWidget> createState() =>
      _TermsAndConditionsWidgetState();
}

class _TermsAndConditionsWidgetState extends State<TermsAndConditionsWidget> {
  bool isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          isChecked: isTermsAccepted,
          onChecked: (value) {
            setState(() {
              isTermsAccepted = value;
              widget.onChanged(value);
            });
          },
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'i agree to the ',
                  style: TextStyles.semiBold13.copyWith(
                    color: const Color(0xFF949D9E),
                  ),
                ),
                TextSpan(
                  text: 'terms and services\n ',
                  style: TextStyles.semiBold13.copyWith(
                    color: AppColors.ksecondaryColor,
                  ),
                ),
                TextSpan(
                  text: 'and ',
                  style: TextStyles.semiBold13.copyWith(color: Colors.grey),
                ),
                TextSpan(
                  text: 'privacy policy',
                  style: TextStyles.semiBold13.copyWith(
                    color: AppColors.ksecondaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
