import 'package:flutter/material.dart';
import 'package:google_signin/layers/domain/entities/user_entity.dart';
import 'package:google_signin/layers/domain/usecases/google_sign_in_use_case.dart';

class AuthProvider extends ChangeNotifier {
  final GoogleSignInUseCase _googleSignInUseCase;

  AuthProvider(this._googleSignInUseCase);

  UserEntity? _user;
  bool _isLoading = false;

  UserEntity? get user => _user;
  bool get isLoading => _isLoading;

  Future<void> loginWithGoogle() async {
    _isLoading = true;
    notifyListeners();
    final user = await _googleSignInUseCase.call();
    _user = user;
    _isLoading = false;
    notifyListeners();
  }
}
