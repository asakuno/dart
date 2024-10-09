import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/entity/auth/login_entity.dart';
import 'package:test_app/repository/users/auth/login_repository.dart';

part 'login_provider.g.dart';

@riverpod
class LoginProvider extends _$LoginProvider {
  @override
  AsyncValue<bool> build() => const AsyncValue.data(false);

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      final loginEntity = LoginEntity(email: email, password: password);
      final repository = ref.read(loginRepositoryProvider);
      final result = await repository.login(loginEntity);

      if (result['success']) {
        await _saveToken(result['token']);
        state = const AsyncValue.data(true);
      } else {
        state = AsyncValue.error(result['error'], StackTrace.current);
      }
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  void resetState() {
    state = const AsyncValue.data(false);
  }
}
