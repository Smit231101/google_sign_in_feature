import 'package:google_signin/layers/data/data_sources/auth_remote_data_source.dart';
import 'package:google_signin/layers/data/models/user_model.dart';
import 'package:google_signin/layers/domain/entities/user_entity.dart';
import 'package:google_signin/layers/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepositoryImpl(this._authRemoteDataSource);

  @override
  Future<UserEntity?> signInWithGoogle() async {
    final user = await _authRemoteDataSource.signInWithGoogle();

    if (user == null) return null;

    return UserModel.fromFirebase(user);
  }

  @override
  Future<void> signOut() async {
    return await _authRemoteDataSource.signOut();
  }
}
