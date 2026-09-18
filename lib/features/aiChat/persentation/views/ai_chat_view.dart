import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/services/git_it_service.dart';
import 'package:movie_app/core/widgets/build_appbar.dart';
import 'package:movie_app/features/aiChat/data/repos/ai_chat_repo.dart';
import 'package:movie_app/features/aiChat/persentation/cubits/aiChat/ai_chat_cubit.dart';
import 'package:movie_app/features/aiChat/persentation/widgets/ai_chat_view_body.dart';

class AiChatView extends StatelessWidget {
  const AiChatView({super.key});
  static const routeName = 'aiChat';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => AiChatCubit(getIt<AiChatRepo>()),
        child: Scaffold(
          appBar: buildAppBar(context, tittle: 'Ai Chat'),
          body: AiChatViewBody(),
        ),
      ),
    );
  }
}
