import 'package:flutter/material.dart';
import 'package:movie_app/core/widgets/custom_text_field.dart';

class PasswordField extends StatefulWidget {
  const new({super.key, this.onSaved});
  final void Function(String?)? onSaved;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscure = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      obscureText: obscure,
      onSaved: widget.onSaved,
      labelText: 'Password',
      suffixIcon: GestureDetector(
        onTap: () {
          obscure = !obscure;
          setState(() {});
        },
        child: obscure
            ? Icon(Icons.remove_red_eye, color: Colors.grey)
            : Icon(Icons.visibility_off, color: Colors.grey),
      ),
    );
  }
}
