import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/core/services/shared_pref.dart';
import 'package:movie_app/features/profile/data/models/user_model.dart';
import 'package:movie_app/features/profile/data/repos/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepo) : super(ProfileInitial()) {
    _loadSettings();
  }

  final ProfileRepo profileRepo;

  String currentLanguage = 'English';
  final List<String> suggestedLanguages = ['English', 'Spanish', 'French'];
  final List<String> otherLanguages = [
    'Arabic',
    'German',
    'Italian',
    'Chinese',
  ];

  bool isNotificationEnabled = true;

  void _loadSettings() {
    isNotificationEnabled = SharedPref.getBool('notifications_enabled');
    final savedLang = SharedPref.getString('app_language');
    if (savedLang.isNotEmpty) {
      currentLanguage = savedLang;
    }
  }

  Future<void> toggleNotification(bool value) async {
    isNotificationEnabled = value;
    await SharedPref.setBool('notifications_enabled', value);
    emit(NotificationToggleState(isNotificationEnabled));
  }

  Future<void> changeLanguage(String language) async {
    currentLanguage = language;
    await SharedPref.setString('app_language', language);
    emit(ChangeLanguageState(language));
  }

  Future<void> getUserProfile({required String token}) async {
    final cachedData = SharedPref.getString('cached_user_profile');
    if (cachedData.isNotEmpty) {
      try {
        final cachedUser = UserModel.fromJson(jsonDecode(cachedData));
        emit(ProfileSuccess(cachedUser));
        return;
      } catch (_) {}
    }

    emit(ProfileLoading());

    var result = await profileRepo.getUserProfile(token: token);
    result.fold((failure) => emit(ProfileFailure(failure.message)), (
      userModel,
    ) async {
      await SharedPref.setString(
        'cached_user_profile',
        jsonEncode(userModel.toJson()),
      );
      emit(ProfileSuccess(userModel));
    });
  }

  Future<void> updateUserProfile({
    required UserModel userModel,
    required String token,
  }) async {
    emit(UpdateProfileLoading());

    // التحديث والتخزين المحلي المباشر
    await SharedPref.setString(
      'cached_user_profile',
      jsonEncode(userModel.toJson()),
    );

    var result = await profileRepo.updateUserProfile(
      userModel: userModel,
      token: token,
    );

    result.fold(
      (failure) {
        // في حال فشل السيرفر يتم اعتماد التعديل المحلي
        emit(UpdateProfileSuccess(userModel));
      },
      (updatedUser) async {
        final finalUser =
            (updatedUser.name != null && updatedUser.name!.isNotEmpty)
            ? updatedUser
            : userModel;

        await SharedPref.setString(
          'cached_user_profile',
          jsonEncode(finalUser.toJson()),
        );

        // إصدار حالة النجاح للتعديل فقط
        emit(UpdateProfileSuccess(finalUser));
      },
    );
  }

  Future<void> logout({required String token}) async {
    emit(LogoutLoading());
    var result = await profileRepo.logout(token: token);
    result.fold((failure) => emit(LogoutFailure(failure.message)), (_) async {
      await SharedPref.setString('cached_user_profile', '');
      emit(LogoutSuccess());
    });
  }
}
