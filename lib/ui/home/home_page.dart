import 'package:flutter/material.dart';
import 'package:study_new_flutter/ui/auth/logout/widgets/logout_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: LogoutButton(),
      ),
    );
  }
}
