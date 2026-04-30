import 'package:google_signin/layers/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity?> signInWithGoogle();
  Future<void> signOut();
}