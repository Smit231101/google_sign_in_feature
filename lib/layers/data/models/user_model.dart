import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_signin/layers/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.uid, required super.email, required super.name});

  factory UserModel.fromFirebase(User user) {
    return UserModel(
      uid: user.uid,
      email: user.email ?? '',
      name: user.displayName ?? '',
    );
  }
}
