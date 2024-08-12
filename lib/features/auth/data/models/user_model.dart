import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entits/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.name, required super.email, required super.userId});

  factory UserModel.fromfirbase(User user) {
    return UserModel(
      name: user.displayName ?? '',
      email: user.email ?? '',
      userId: user.uid,
    );
  }
}
