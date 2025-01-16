<<<<<<< HEAD
class User {
  final int id;
  final String name;
  final String email;
  final String password;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.password});
}

class NotLoggedUser extends User {
  NotLoggedUser() : super(id: 0, name: '', email: '', password: '');
}

class LoggedUser extends User {
  final String token;
  final String refreshToken;

  LoggedUser(
      {required super.id,
      required super.name,
      required super.email,
      required super.password,
      required this.token,
      required this.refreshToken});
}
=======
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

@freezed
sealed class User with _$User {
  const factory User({
    required int id,
    required String name,
    required String email,
    required String password,
  }) = _User;

  const factory User.notLogged() = NotLoggedUser;

  const factory User.logged({
    required int id,
    required String name,
    required String email,
    required String password,
    required String token,
    required String refreshToken,
  }) = LoggedUser;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
>>>>>>> d9a8751 (last update of class)
