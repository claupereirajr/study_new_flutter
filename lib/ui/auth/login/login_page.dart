import 'package:flutter/material.dart';
import 'package:result_command/result_command.dart';
import 'package:study_new_flutter/config/dependencies.dart';
import 'package:study_new_flutter/domain/dtos/credentials.dart';
import 'package:study_new_flutter/domain/validators/credentials_validator.dart';
import 'package:study_new_flutter/ui/auth/login/controller/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginController = injector.get<LoginController>();
  final validator = CredentialsValidator();
  final credentials = Credentials();

  @override
  void initState() {
    super.initState();
    loginController.loginCommand.addListener(_listenable);
  }

  void _listenable() {
    if (loginController.loginCommand.isFailure) {
      final error = loginController.loginCommand.value as FailureCommand;
      final snackBar = SnackBar(
        content: Text(error.error.toString()),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  void dispose() {
    loginController.loginCommand.removeListener(_listenable);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(size: 100),
            SizedBox(height: 60),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onChanged: credentials.setEmail,
              validator: validator.byField(credentials, 'email'),
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onChanged: credentials.setPassword,
              validator: validator.byField(credentials, 'password'),
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ListenableBuilder(
                listenable: loginController.loginCommand,
                builder: (context, _) {
                  return ElevatedButton(
                    onPressed: loginController.loginCommand.isRunning
                        ? null
                        : () {
                            if (validator.validate(credentials).isValid) {
                              loginController.loginCommand.execute(credentials);
                            }
                          },
                    child: Text('Login'),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
