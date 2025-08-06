abstract class AuthRepository {
  Future<bool> signIn();
  Future<bool> signOut();

  // check for authentication

  /// Check if the user is authenticated either locally or remotely
  Future<bool> isAuthenticated();
  Future<bool> isRemoteAuthenticated();
  Future<bool> isLocalAuthenticated();
}
