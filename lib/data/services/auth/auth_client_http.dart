import 'package:result_dart/result_dart.dart';
import 'package:study_new_flutter/data/services/client_http.dart';
import 'package:study_new_flutter/domain/dtos/credentials.dart';
import 'package:study_new_flutter/domain/entities/user_entity.dart';

class AuthClientHttp {
  final ClientHttp _clientHttp;

  AuthClientHttp(this._clientHttp);

  AsyncResult<LoggedUser> login(Credentials credentials) async {
    final response = await _clientHttp.post('/auth/login', {
      'email': credentials.email,
      'password': credentials.password,
    });

    return response.map((response) {
      return LoggedUser.fromJson(response.data);
    });
  }
}
