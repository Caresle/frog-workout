import 'package:workouts_app/data/data.dart';

abstract class AuthLocalDs implements AuthHandlerDs {
  Future<bool> saveToken(String token);
  Future<String?> getToken();
}
