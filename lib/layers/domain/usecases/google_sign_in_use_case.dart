import 'package:google_signin/layers/domain/entities/user_entity.dart';
import 'package:google_signin/layers/domain/repositories/auth_repository.dart';

class GoogleSignInUseCase {
  final AuthRepository _authRepository;

  GoogleSignInUseCase(this._authRepository);

  Future<UserEntity?> call() async {
    return await _authRepository.signInWithGoogle();
  }
}
