import 'package:workouts_app/data/data.dart';

class AuthLocalDsImpl implements AuthHandlerDs {
  @override
  Future<bool> isAuthenticated() async {
    return false;
  }

  @override
  Future<bool> login() async {
    return true;
  }
}
