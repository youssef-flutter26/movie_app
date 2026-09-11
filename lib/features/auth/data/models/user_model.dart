import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app/features/auth/domain/entities/user_entity.dart';

class UserAuthModel extends UserEntity {
  new({required super.name, required super.email, required super.password});
  factory UserAuthModel.fromFirebaseUser(User user) {
    return UserAuthModel(
      name: user.displayName ?? '',
      email: user.email ?? '',
      password: '',
    );
  }
}
