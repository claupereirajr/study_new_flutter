import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:study_new_flutter/config/dependencies.dart';
import 'package:study_new_flutter/ui/auth/logout/controller/logout_controller.dart';

class LogoutButton extends StatefulWidget {
  const LogoutButton({super.key});

  @override
  State<LogoutButton> createState() => _LogoutButtonState();
}

class _LogoutButtonState extends State<LogoutButton> {
  final logoutController = injector.get<LogoutController>();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: logoutController.logoutCommand.execute,
      child: Text('Logout'),
    );
  }
}
