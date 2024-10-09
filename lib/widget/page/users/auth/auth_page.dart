import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('auth画面')),
        body: Center(
            child: Column(
          children: [
            const Text('auth画面です'),
            ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).go('/');
                },
                child: const Text('init画面に遷移')),
            ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).go('/auth/login');
                },
                child: const Text('login画面に遷移')),
            ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).go('/auth/register');
                },
                child: const Text('register画面に遷移'))
          ],
        )));
  }
}
