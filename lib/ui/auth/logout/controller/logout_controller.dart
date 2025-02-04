import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';
import 'package:study_new_flutter/data/repositories/auth/auth_repository.dart';

class LogoutController {
  final AuthRepository _authRepository;

  LogoutController(this._authRepository);

  late final logoutCommand = Command0(_logout);

  AsyncResult<Unit> _logout() {
    return _authRepository.logout();
  }
}
