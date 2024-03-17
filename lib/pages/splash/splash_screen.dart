import 'package:flutter/material.dart';
import 'package:task_leap/config/config.dart';

class SplashScreen extends StatefulWidget {
  static const String route = "/splash-screen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> init() async {
    /*
    The line is imitating the verifying process that if a user exists or not.

    Here we add a note to remember later that we need to add something here.
     */
    // TODO: Check if user exists
    await Future.delayed(const Duration(seconds: 1));

    // mounted ensures that the context is still present and user has not went out of context
    if (mounted) {
      // TODO: Navigate to Auth Screen
    }
  }

  @override
  void initState() {
    super.initState();
    /*
     We check here if the user is logged in or not

     Being an async task we cannot directly use that inside the initState
     So we make another function to do that. And in the meanwhile the user is shown
     the app logo and name.
     We can get fancy here and show some ideal animations to keep the user interested
     while we check if the user is logged in or not.
     */
    init();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Show the app logo and maybe the app name
    return const Placeholder();
  }
}
