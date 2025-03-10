import 'dart:async';

import 'package:flutter/material.dart';
import 'package:study_new_flutter/data/repositories/auth/auth_repository.dart';
import 'package:study_new_flutter/domain/entities/user_entity.dart';

class MainController extends ChangeNotifier {
  final AuthRepository _authRepository;

  User _user = NotLoggedUser();
  User get user => _user;

  late final StreamSubscription _userSubscription;

  MainController(this._authRepository) {
    _userSubscription = _authRepository.userObserver().listen((user) {
      _user = user;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _userSubscription.cancel();
    super.dispose();
  }
}
