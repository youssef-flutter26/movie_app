import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/profile/data/models/legal_policy_model.dart';
import 'package:movie_app/features/profile/data/repos/legal_policy_repo.dart';

// States
abstract class LegalPolicyState {}

class LegalPolicyInitial extends LegalPolicyState {}

class LegalPolicyLoading extends LegalPolicyState {}

class LegalPolicySuccess extends LegalPolicyState {
  final LegalPolicyModel policy;
  LegalPolicySuccess(this.policy);
}

class LegalPolicyFailure extends LegalPolicyState {
  final String errMessage;
  LegalPolicyFailure(this.errMessage);
}

// Cubit
class LegalPolicyCubit extends Cubit<LegalPolicyState> {
  final LegalPolicyRepo legalPolicyRepo;

  LegalPolicyCubit(this.legalPolicyRepo) : super(LegalPolicyInitial());

  Future<void> fetchLegalPolicy() async {
    emit(LegalPolicyLoading());

    final result = await legalPolicyRepo.getLegalPolicy();

    result.fold(
      (failure) => emit(LegalPolicyFailure(failure)),
      (policy) => emit(LegalPolicySuccess(policy)),
    );
  }
}
