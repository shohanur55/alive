import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/di/dependency_injection.dart';

part 'logout_provider.g.dart';

@Riverpod(keepAlive: true)
class Logout extends _$Logout {
  @override
  AsyncValue<bool?> build() {
    return const AsyncValue.data(null);
  }

  Future<void> call() async {
    if (state.isLoading) return;

    state = const AsyncValue.loading();

    // Intentional simulated delay to show loading indicator
    await Future.delayed(const Duration(seconds: 1));

    try {
      await ref.read(logoutUseCaseProvider).call();
      // Invalidate all repository providers to remove cached data
      ref.read(resetRepositoryUseCaseProvider).call(ref);

      state = const AsyncValue.data(true);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
