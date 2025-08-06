/// General handler for authentication common actions
/// this should be implemented by the differents services
/// no matter if is local or remote like for example supabase or isardb,
/// local storage, etc
abstract class AuthHandlerDs {
  Future<bool> isAuthenticated();
  Future<bool> signIn();
}
