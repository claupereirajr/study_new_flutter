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
