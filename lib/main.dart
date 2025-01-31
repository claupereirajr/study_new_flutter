import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';
import 'package:study_new_flutter/config/dependencies.dart';

import 'main.route.dart';
part 'main.g.dart';

void main() {
  setupDependencies();
  runApp(const MainApp());
}

@Main('lib/ui')
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  // This widget is the root of your application.
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
