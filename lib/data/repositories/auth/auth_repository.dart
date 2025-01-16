import 'package:result_dart/result_dart.dart';
import 'package:study_new_flutter/domain/dtos/credentials.dart';
import 'package:study_new_flutter/domain/entities/user_entity.dart';

abstract interface class AuthRepository {
  AsyncResult<LoggedUser> login(Credentials credentials);
  AsyncResult<Unit> logout();
  AsyncResult<LoggedUser> getUser();
  Stream<User> userObserver();

  void dispose();
}
