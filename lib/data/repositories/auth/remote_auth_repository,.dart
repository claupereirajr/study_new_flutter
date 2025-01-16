import 'dart:async';

import 'package:result_dart/result_dart.dart';
import 'package:study_new_flutter/data/repositories/auth/auth_repository.dart';
import 'package:study_new_flutter/domain/entities/user_entity.dart';

class RemoteAuthRepository implements AuthRepository {
  final _streamController = StreamController<User>.broadcast();

  @override
  AsyncResult<LoggedUser> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  AsyncResult<LoggedUser> login() {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  AsyncResult<Unit> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Stream<User> userObserver() {
    return _streamController.stream;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _streamController.close();
  }
}
