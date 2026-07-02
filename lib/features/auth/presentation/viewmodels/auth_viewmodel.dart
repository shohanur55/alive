import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/user_entity.dart';
import '../providers/auth_providers.dart';

part 'auth_viewmodel.g.dart';

@riverpod
class AuthViewModel extends _$AuthViewModel {
  @override
  FutureOr<UserEntity?> build() {
    // Listen to stream of auth state changes to dynamically update the notifier state
    ref.listen(authStateChangesProvider, (previous, next) {
      if (next.hasValue) {
        state = AsyncValue.data(next.value);
      }
    });
    
    final repository = ref.watch(authRepositoryProvider);
    return repository.currentUser;
  }

  /// Initiates sign in with Google
  Future<UserEntity?> loginWithGoogle() async {
    state = const AsyncValue.loading();
    UserEntity? user;
    state = await AsyncValue.guard(() async {
      user = await ref.read(signInWithGoogleUseCaseProvider).call();
      return user;
    });
    return user;
  }

  /// Initiates sign out
  Future<void> logout() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(signOutUseCaseProvider).call();
      return null;
    });
  }
}
