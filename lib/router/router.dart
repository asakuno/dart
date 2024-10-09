import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_app/widget/page/users/auth/auth_page.dart';
import 'package:test_app/widget/page/users/auth/login.dart';
import 'package:test_app/widget/page/users/auth/register_page.dart';
import 'package:test_app/widget/page/users/home/init_page.dart';

part 'router.g.dart';

@TypedGoRoute<InitRoute>(path: '/')
class InitRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) => const Initpage();
}

@TypedGoRoute<AuthRoute>(path: '/auth', routes: [
  TypedGoRoute<LoginRoute>(
    path: '/login',
  ),
  TypedGoRoute<RegisterRoute>(
    path: '/register',
  )
])
class AuthRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) => const AuthPage();
}

class LoginRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) => LoginPage();
}

class RegisterRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const RegisterPage();
}
