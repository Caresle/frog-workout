import 'package:workouts_app/data/datasources/auth/auth_handler_ds.dart';
import 'package:workouts_app/domain/domain.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthHandlerDs _localDs;
  final AuthHandlerDs _remoteDs;

  AuthRepositoryImpl({
    required AuthHandlerDs local,
    required AuthHandlerDs remote,
  }) : _localDs = local,
       _remoteDs = remote;

  @override
  Future<bool> isAuthenticated() async {
    final isLocal = await _localDs.isAuthenticated();
    if (isLocal) return true;

    final isRemote = await _remoteDs.isAuthenticated();

    return isRemote;
  }

  @override
  Future<bool> isLocalAuthenticated() {
    return _localDs.isAuthenticated();
  }

  @override
  Future<bool> isRemoteAuthenticated() {
    return _remoteDs.isAuthenticated();
  }

  @override
  Future<bool> login() {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<bool> logout() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<bool> localLogin() {
    return _localDs.login();
  }
}
