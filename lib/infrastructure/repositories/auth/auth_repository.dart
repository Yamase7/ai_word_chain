abstract class AuthRepository {
  Future<void> signInAsGuest(String username);
  Future<void> signInWithEmailAndPassword(String email, String password);
}
