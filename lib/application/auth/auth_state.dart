class AuthState {
  AuthState({
    this.authenticated = false,
    this.error = '',
  });

  final bool authenticated;
  final String error;

  AuthState copyWith({
    bool? authenticated,
    String? error,
  }) {
    return AuthState(
      authenticated: authenticated ?? this.authenticated,
      error: error ?? this.error,
    );
  }
}
