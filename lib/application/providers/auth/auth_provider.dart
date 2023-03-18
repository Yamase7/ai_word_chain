import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../infrastructure/repositories/auth/auth_repository.dart';
import '../../../infrastructure/repositories/auth/firebase_auth_repository.dart';
import '../../auth/auth_state.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return FirebaseAuthRepository();
});

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref.watch(authRepositoryProvider));
});

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier(this._authRepository) : super(AuthState());

  final AuthRepository _authRepository;

  Future<void> signInAsGuest(String username) async {
    try {
      await _authRepository.signInAsGuest(username);
      state = AuthState(authenticated: true);
    } catch (e) {
      state = AuthState(error: e.toString());
    }
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _authRepository.signInWithEmailAndPassword(email, password);
      state = AuthState(authenticated: true);
    } catch (e) {
      state = AuthState(error: e.toString());
    }
  }
}
