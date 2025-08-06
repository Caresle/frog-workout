import 'package:flutter/material.dart';
import 'package:workouts_app/domain/domain.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepository _repository;

  AuthProvider(this._repository);

  Future<bool> isAuthenticated() {
    return _repository.isAuthenticated();
  }
}
