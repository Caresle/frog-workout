import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:workouts_app/config/environment.dart';

class SupabaseHandler {
  SupabaseClient? _supabase;

  static init() async {
    await Supabase.initialize(
      url: Environment.supabaseUrl,
      anonKey: Environment.supabaseAnon,
    );
  }

  SupabaseClient getInstance() {
    if (_supabase != null) return _supabase!;

    _supabase = Supabase.instance.client;
    return _supabase!;
  }
}
