import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'package:workouts_app/data/data.dart';

class AuthLocalDsImpl extends AuthLocalDs {
  final _tokenKey = 'user_token';

  @override
  Future<bool> isAuthenticated() async {
    final data = await getToken();
    return data != null;
  }

  @override
  Future<bool> login() async {
    String token = Uuid().v4();
    final saved = await saveToken(token);
    return saved;
  }

  @override
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  @override
  Future<bool> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(_tokenKey, token);
  }
}
