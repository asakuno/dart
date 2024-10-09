import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Initpage extends StatelessWidget {
  const Initpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('初期画面')),
        body: Center(
            child: Column(
          children: [
            const Text('初期画面です'),
            ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).go('/auth');
                },
                child: const Text('auth画面に遷移')),
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
