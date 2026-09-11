import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/services/git_it_service.dart'; // مسار الـ getIt عندك
import 'package:movie_app/core/widgets/build_appbar.dart';
import 'package:movie_app/features/profile/data/repos/legal_policy_repo.dart';
import 'package:movie_app/features/profile/presentation/cubits/legal_policy_cubit.dart';
import 'package:movie_app/features/profile/presentation/widgets/legal_and_policy_body.dart';

class LegalAndPolicy extends StatelessWidget {
  const LegalAndPolicy({super.key});

  static const String routeName = 'LegalAndPolicies';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          LegalPolicyCubit(getIt<LegalPolicyRepo>())..fetchLegalPolicy(),
      child: Scaffold(
        appBar: buildAppBar(context, tittle: 'Legal & Policy'),
        body: BlocBuilder<LegalPolicyCubit, LegalPolicyState>(
          builder: (context, state) {
            if (state is LegalPolicyLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is LegalPolicySuccess) {
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: LegalAndPolicyBody(policy: state.policy),
              );
            } else if (state is LegalPolicyFailure) {
              return Center(
                child: Text(
                  state.errMessage,
                  style: const TextStyle(color: Colors.white),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
