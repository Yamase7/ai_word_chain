// lib/infrastructure/auth/firebase_auth_repository.dart

import 'package:firebase_auth/firebase_auth.dart';
import 'auth_repository.dart';

class FirebaseAuthRepository implements AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<void> signInAsGuest(String username) async {
    await _firebaseAuth.signInAnonymously();
    // ゲストユーザーとしてFirebaseにサインインするロジックを実装します。
  }

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }
}
