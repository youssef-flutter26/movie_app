class UserSettingsModel {
  final bool isNotificationEnabled;
  final String language;

  const UserSettingsModel({
    this.isNotificationEnabled = true,
    this.language = 'English (UK)',
  });

  factory UserSettingsModel.fromJson(Map<String, dynamic> json) {
    return UserSettingsModel(
      isNotificationEnabled: json['is_notification_enabled'] as bool? ?? true,
      language: json['language'] as String? ?? 'English (UK)',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'is_notification_enabled': isNotificationEnabled,
      'language': language,
    };
  }
}
