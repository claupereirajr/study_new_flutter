import 'package:auto_injector/auto_injector.dart';
import 'package:dio/dio.dart';
import 'package:study_new_flutter/data/repositories/auth/auth_repository.dart';
import 'package:study_new_flutter/data/repositories/auth/remote_auth_repository.dart';
import 'package:study_new_flutter/data/services/auth/auth_client_http.dart';
import 'package:study_new_flutter/data/services/auth/auth_local_storage.dart';
import 'package:study_new_flutter/data/services/client_http.dart';
import 'package:study_new_flutter/data/services/local_storage.dart';
import 'package:study_new_flutter/main_controller.dart';
import 'package:study_new_flutter/ui/auth/login/controller/login_controller.dart';
import 'package:study_new_flutter/ui/auth/logout/controller/logout_controller.dart';

final injector = AutoInjector();

void setupDependencies() {
  injector.addSingleton<AuthRepository>(RemoteAuthRepository.new);
  injector.addInstance(Dio());
  injector.addSingleton(ClientHttp.new);
  injector.addSingleton(LocalStorage.new);
  injector.addSingleton(AuthClientHttp.new);
  injector.addSingleton(AuthLocalStorage.new);
  injector.addSingleton(MainController.new);
  injector.addSingleton(LoginController.new);
  injector.addSingleton(LogoutController.new);
}
