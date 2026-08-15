import '../../core/base/result.dart';
import '../entities/login_entity.dart';
import '../entities/sign_up_entity.dart';
import '../entities/user_entity.dart';
import '../repositories/authentication_repository.dart';

final class RegisterUseCase {
  RegisterUseCase(this.repository);

  final AuthenticationRepository repository;

  Future<SignUpResponseEntity> call(SignUpRequestEntity request) async {
    return repository.register(request);
  }
}

final class LoginUseCase {
  LoginUseCase(this.repository);

  final AuthenticationRepository repository;

  Future<Result<LoginResponseEntity, String>> call({
    required String email,
    required String password,
    bool? shouldRemember,
  }) async {
    final request = LoginRequestEntity(
      username: email,
      password: password,
      shouldRemeber: shouldRemember,
    );

    final result = await repository.login(request);

    return switch (result) {
      Success(:final data) => Success(data: data),
      Error(:final error) => Error(error.message),
      _ => const Error('Something went wrong'),
    };
  }
}

final class SignInWithGoogleUseCase {
  SignInWithGoogleUseCase(this.repository);

  final AuthenticationRepository repository;

  Future<Result<UserEntity?, String>> call() async {
    final result = await repository.signInWithGoogle();
    return switch (result) {
      Success(:final data) => Success(data: data),
      Error(:final error) => Error(error.message),
      _ => const Error('Google Sign-In failed'),
    };
  }
}

final class SignOutGoogleUseCase {
  SignOutGoogleUseCase(this.repository);

  final AuthenticationRepository repository;

  Future<Result<void, String>> call() async {
    final result = await repository.signOutUser();
    return switch (result) {
      Success(:final data) => Success(data: data),
      Error(:final error) => Error(error.message),
      _ => const Error('Sign out failed'),
    };
  }
}

final class GetCurrentUserUseCase {
  GetCurrentUserUseCase(this.repository);

  final AuthenticationRepository repository;

  UserEntity? call() {
    return repository.getCurrentUser();
  }
}

final class GetAuthStateChangesUseCase {
  GetAuthStateChangesUseCase(this.repository);

  final AuthenticationRepository repository;

  Stream<UserEntity?> call() {
    return repository.authStateChanges;
  }
}

final class LogoutUseCase {
  LogoutUseCase(this.repository);

  final AuthenticationRepository repository;

  Future<void> call() async {
    return repository.logout();
  }
}
