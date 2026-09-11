class UserModel {
  final String? id;
  final String? name;
  final String? email;
  final String? password;
  final String? phoneNumber;
  final String? avatarUrl;
  final bool isPremium;

  const UserModel({
    this.id,
    this.name,
    this.email,
    this.password,
    this.phoneNumber,
    this.avatarUrl,
    this.isPremium = false,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    // TMDB avatar path parsing
    String? avatar;
    if (json['avatar'] != null && json['avatar']['tmdb'] != null) {
      final path = json['avatar']['tmdb']['avatar_path'];
      if (path != null) {
        avatar = 'https://image.tmdb.org/t500$path';
      }
    }

    return UserModel(
      id: json['id']?.toString(),
      name: (json['name'] != null && json['name'].toString().isNotEmpty)
          ? json['name'] as String?
          : json['username'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      phoneNumber: json['phone_number'] as String?,
      avatarUrl: avatar ?? json['avatar_url'] as String?,
      isPremium: json['is_premium'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'phone_number': phoneNumber,
      'avatar_url': avatarUrl,
      'is_premium': isPremium,
    };
  }
}
