import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/features/aiChat/persentation/cubits/aiChat/ai_chat_cubit.dart';

class AiTextField extends StatefulWidget {
  const AiTextField({super.key});

  @override
  State<AiTextField> createState() => _AiTextFieldState();
}

class _AiTextFieldState extends State<AiTextField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      context.read<AiChatCubit>().sendMessage(prompt: text);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.all(12.r),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                onSubmitted: (_) => _sendMessage(),
                decoration: InputDecoration(
                  hintText: 'Write your message...',
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.h,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                ),
              ),
            ),
            SizedBox(width: 8.w),
            IconButton.filled(
              onPressed: _sendMessage,
              icon: Icon(Icons.send_rounded, size: 20.sp),
            ),
          ],
        ),
      ),
    );
  }
}
