abstract class AuthRepository {
  Future<bool> login();
  Future<bool> logout();

  // check for authentication

  /// Check if the user is authenticated either locally or remotely
  Future<bool> isAuthenticated();
  Future<bool> isRemoteAuthenticated();
  Future<bool> isLocalAuthenticated();

  Future<bool> localLogin();
}
