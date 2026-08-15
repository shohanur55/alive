import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/base/result.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../domain/entities/user_entity.dart';

part 'login_provider.g.dart';

@riverpod
class Login extends _$Login {
  @override
  AsyncValue build() {
    return const AsyncValue.data(null);
  }

  void login({
    required String email,
    required String password,
    bool? shouldRemember,
  }) async {
    if (state.isLoading) return;

    state = const AsyncValue.loading();

    final result = await ref.read(loginUseCaseProvider).call(
          email: email,
          password: password,
          shouldRemember: shouldRemember,
        );

    state = switch (result) {
      Success() => AsyncValue.data(result),
      Error(:final error) => AsyncValue.error(error, StackTrace.current),
      _ => AsyncValue.error('Something went wrong', StackTrace.current),
    };
  }

  Future<UserEntity?> loginWithGoogle() async {
    if (state.isLoading) return null;

    state = const AsyncValue.loading();

    final result = await ref.read(signInWithGoogleUseCaseProvider).call();

    switch (result) {
      case Success(:final data):
        state = AsyncValue.data(data);
        return data;
      case Error(:final error):
        state = AsyncValue.error(error, StackTrace.current);
        return null;
      default:
        state = AsyncValue.error('Google Sign-In failed', StackTrace.current);
        return null;
    }
  }
}
