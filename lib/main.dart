import 'package:flutter/material.dart';
import 'config/config.dart';
import 'pages/pages.dart';
import 'utils/utils.dart';

void main() {
  runApp(const TaskLeap());
}

class TaskLeap extends StatelessWidget {
  const TaskLeap({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      routes: {
        SplashScreen.route: (BuildContext context) => const SplashScreen(),
      },
      builder: ErrorHandler.handle,
      initialRoute: SplashScreen.route,
    );
  }
}
