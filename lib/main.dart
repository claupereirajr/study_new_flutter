import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';
import 'package:study_new_flutter/config/dependencies.dart';
import 'package:study_new_flutter/domain/entities/user_entity.dart';
import 'package:study_new_flutter/main_controller.dart';

import 'main.route.dart';
part 'main.g.dart';

void main() {
  setupDependencies();
  runApp(const MainApp());
}

@Main('lib/ui')
class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final mainController = injector.get<MainController>();

  @override
  void initState() {
    super.initState();

    mainController.addListener(() {
      if (mainController.user is LoggedUser) {
        Routefly.push(routePaths.home);
      } else {
        Routefly.push(routePaths.auth.login);
      }
    });
  }

  @override
  void dispose() {
    mainController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Routefly.routerConfig(
        routes: routes,
        initialPath: routePaths.auth.login,
      ),
    );
  }
}
