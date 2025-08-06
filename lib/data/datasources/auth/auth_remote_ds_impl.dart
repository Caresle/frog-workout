import 'package:workouts_app/data/data.dart';

class AuthRemoteDsImpl implements AuthHandlerDs {
  @override
  Future<bool> isAuthenticated() async {
    return false;
  }

  @override
  Future<bool> signIn() async {
    return true;
  }
}
