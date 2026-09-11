import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/widgets/build_appbar.dart';
import 'package:movie_app/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:movie_app/features/profile/presentation/widgets/language_view_body.dart';

class LanguageView extends StatelessWidget {
  const LanguageView({super.key});

  static const String routeName = 'language';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, tittle: 'Language'),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        buildWhen: (previous, current) => current is ChangeLanguageState,
        builder: (context, state) {
          final cubit = BlocProvider.of<ProfileCubit>(context);
          return LanguageViewBody(
            selectedLanguage: cubit.currentLanguage,
            suggestedLanguages: cubit.suggestedLanguages,
            otherLanguages: cubit.otherLanguages,
          );
        },
      ),
    );
  }
}
