import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/features/aiChat/persentation/cubits/aiChat/ai_chat_cubit.dart';
import 'package:movie_app/features/aiChat/persentation/widgets/ai_text_field.dart';
import 'package:movie_app/features/aiChat/persentation/widgets/message_ai.dart';
import 'package:movie_app/features/aiChat/persentation/widgets/my_message.dart';

class AiChatViewBody extends StatelessWidget {
  const AiChatViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocConsumer<AiChatCubit, AiChatState>(
            listener: (context, state) {
              if (state is AiChatFailure) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.errMessage)));
              }
            },
            builder: (context, state) {
              final messages = context.read<AiChatCubit>().messages;

              if (messages.isEmpty && state is! AiChatLoading) {
                return const Center(
                  child: Text(
                    'اسأل الذكاء الاصطناعي عن أي ترشيحات أفلام',
                    style: TextStyle(color: Colors.grey),
                  ),
                );
              }

              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                itemCount: messages.length + (state is AiChatLoading ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index == messages.length) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }

                  final messageModel = messages[index];

                  return Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: messageModel.isUser
                        ? Align(
                            alignment: Alignment.centerRight,
                            child: MyMessage(message: messageModel.message),
                          )
                        : Align(
                            alignment: Alignment.centerLeft,
                            child: MessageAi(message: messageModel.message),
                          ),
                  );
                },
              );
            },
          ),
        ),
        const AiTextField(),
      ],
    );
  }
}
