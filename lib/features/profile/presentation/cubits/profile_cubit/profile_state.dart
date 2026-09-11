part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

// Get Profile States
final class ProfileLoading extends ProfileState {}

final class ProfileSuccess extends ProfileState {
  final UserModel userModel;
  ProfileSuccess(this.userModel);
}

final class ProfileFailure extends ProfileState {
  final String errMessage;
  ProfileFailure(this.errMessage);
}

// Legal and Policy States
final class LegalAndPolicyLoading extends ProfileState {}

final class LegalAndPolicySuccess extends ProfileState {
  final List<Map<String, String>> policies;
  LegalAndPolicySuccess(this.policies);
}

final class LegalAndPolicyFailure extends ProfileState {
  final String errMessage;
  LegalAndPolicyFailure(this.errMessage);
}

// Update Profile States
final class UpdateProfileLoading extends ProfileState {}

final class UpdateProfileSuccess extends ProfileState {
  final UserModel userModel;
  UpdateProfileSuccess(this.userModel);
}

final class UpdateProfileFailure extends ProfileState {
  final String errMessage;
  UpdateProfileFailure(this.errMessage);
}

// Logout States
final class LogoutLoading extends ProfileState {}

final class LogoutSuccess extends ProfileState {}

final class LogoutFailure extends ProfileState {
  final String errMessage;
  LogoutFailure(this.errMessage);
}

// Language States
final class ChangeLanguageState extends ProfileState {
  final String language;
  ChangeLanguageState(this.language);
}

// Notification States
final class NotificationToggleState extends ProfileState {
  final bool isEnabled;
  NotificationToggleState(this.isEnabled);
}
